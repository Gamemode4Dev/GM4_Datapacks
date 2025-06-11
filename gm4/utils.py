import subprocess
import warnings
from contextlib import contextmanager
from dataclasses import asdict, dataclass, replace
from functools import total_ordering
from typing import Any, Generic, Iterator, List, TypeVar

from beet import Advancement, Context, ItemModifier, ListOption, LootTable, Predicate
from mecha import (
    AbstractNode,
    AstJsonObjectEntry,
    AstJsonObjectKey,
    AstJsonValue,
    AstNbtCompound,
    DiagnosticCollection,
    DiagnosticError,
    Mecha,
    rule,
)
from pydantic.v1 import validator  # type: ignore ; v1 validator behaves strangely with type checking
from pydantic.v1.generics import GenericModel
from tokenstream import SourceLocation, set_location

T = TypeVar('T')
import csv
from pathlib import Path


def run(cmd: list[str]|str) -> str:
    """Run a shell command and return the stdout."""
    return subprocess.run(cmd, capture_output=True, encoding="utf8", shell=isinstance(cmd, str)).stdout.strip()

def X_int(val: str) -> int | None:
    """Int casting that accepts character 'X' and returns None"""
    return None if val.lower() == 'x' else int(val)

def add_namespace(val: str, namespace: str) -> str:
    """Adds a namsepace prefix to a string, if one does not already exist"""
    if ":" not in val:
        return f"{namespace}:{val}"
    return val

@dataclass
@total_ordering
class Version():
    """Class with methods useful for semver versions in the gm4 build pipeline"""
    major: int|None
    minor: int|None
    patch: int|None

    def __init__(self, input: str):
        self.major, self.minor, self.patch = map(X_int, input.split("."))

    def __str__(self):
        if type(None) in map(type, [self.major, self.minor, self.patch]):
            warnings.warn(f"Version number was printed to string when one or more fields are not set")
        return f"{self.major}.{self.minor}.{self.patch}"
    
    def int_rep(self) -> int:
        """returns integer representation of version, for use in datapack scoreboards"""
        if type(None) in map(type, [self.major, self.minor, self.patch]):
            raise TypeError(f"Version number cannot be converted to integer when one or more fields are not set")
        return 100_000*self.major + 1_000*self.minor + self.patch # type: ignore

    def __eq__(self, other: object) -> bool:
        if other is None:
            return False
        elif isinstance(other, Version):
            return self.major==other.major and self.minor==other.minor and self.patch==other.patch
        raise TypeError
    
    def __lt__(self, other: object) -> bool:
        if isinstance(other, Version):
            if self.major is None or self.minor is None or self.patch is None \
                or other.major is None or other.minor is None or other.patch is None:
                raise TypeError(f"Version numbers cannot be compared when one or more fields are not set")
            if self.major < other.major:
                return True
            elif self.major == other.major:
                if self.minor < other.minor:
                    return True
                elif self.minor == other.minor:
                    if self.patch < other.patch:
                        return True
            return False
        raise TypeError
    
    def replace(self, **changes: Any):
        params = asdict(self) | changes
        params = {k:(v if v is not None else 'X') for k,v in params.items()}
        return Version(f"{params['major']}.{params['minor']}.{params['patch']}")
    
def nested_get(d: dict[str, Any], key: str) -> list[Any]:
    """Recursively traverses a string-keyed dict (like minecraft json files) for the specified key, returning all that exist
        returns empty list and throws no errors if key does not exist"""
    ret_list: list[Any] = []
    for k, v in d.items():
        if k == key:
            ret_list.append(d[k])
        elif isinstance(v, dict):
            ret_list.extend(nested_get(d[k], key))
        elif isinstance(v, list):
            for elem in d[k]:
                if isinstance(elem, dict):
                    ret_list.extend(nested_get(elem, key)) #type: ignore ; NBT is hard to type due to its nested nature
    return ret_list

class NoneAttribute():
    """Object which returns None for any arbitrary attribute access. Used for default members"""
    def __getattribute__(self, __name: str) -> None:
        return None

class MapOption(GenericModel, Generic[T]):
    """A union-like type of dict and list, supporting common methods for both
        - Written for use in resource_pack plugin's texture lists"""
    __root__: list[T]|dict[str,T] = []

    def entries(self) -> list[T]:
        if isinstance(self.__root__, list):
            return self.__root__
        return list(self.__root__.values())
    
    def __getitem__(self, key: str|int) -> T:
        if isinstance(key, int):
            return self.entries()[key]
        if isinstance(self.__root__, list):
            raise KeyError(f"MapOption has no mapping data keys. Could not retrieve {key}")
        return self.__root__[key]
    
    def items(self):
        if isinstance(self.__root__, dict):
            return self.__root__.items()
        raise KeyError("MapOption has no mapping data keys. Can not retrieve items()")
    
    @validator("__root__", pre=True)  # type: ignore ; v1 validator behaves strangely with type checking
    def validate_root(cls, value: list[T]|dict[str,T]|T) -> list[T]|dict[str,T]:
        if value is None:
            value = []
        elif isinstance(value, ListOption):
            value = value.entries()
        if not isinstance(value, (list, tuple, dict)): # single element
            value = [value]
        return value # type: ignore

# TODO 1.20.5: might not need this anymore
class InvokeOnJsonNbt:
    """Extendable mixin to run MutatingReducer's rules on nbt within advancements, loot_tables ect..."""
    def __init__(self, ctx: Context):
        self.ctx = ctx
        raise RuntimeError("InvokeOnJsonNbt should not be directly instantiated. It is a mixin for MutatingReducers and should be interited instead")
    
    @contextmanager
    def use_diagnostics(self, diagnostics: DiagnosticCollection) -> Iterator[None]:
        """Class is mixed into MutatingReducer, who does have this method. Passed here for type completion"""
        raise NotImplementedError()

    def invoke(self, node: AbstractNode, *args: Any, **kwargs: Any) -> Any:
        """Class is mixed into MutatingReducer, who does have this method. Passed here for type completion"""
        raise NotImplementedError()
    

    @rule(AstJsonObjectEntry, key=AstJsonObjectKey(value='nbt'))
    @rule(AstJsonObjectEntry, key=AstJsonObjectKey(value='tag'))
    def process_nbt_in_json(self, node: AstJsonObjectEntry):
        mc = self.ctx.inject(Mecha)
        if isinstance(mc.database.current, (Advancement, LootTable, ItemModifier, Predicate)):
            if isinstance(node.value, AstJsonValue) and isinstance(node.value.value, str) \
                and node.value.value.startswith("{") and node.value.value.endswith("}"): # excludes location check block/fluid tags - easier than making rule that checks for 'set_nbt' functions on the same json level
                try:
                    nbt = mc.parse(node.value.value.replace("\n", "\\\\n"), type=AstNbtCompound)
                except DiagnosticError as exc:
                    # if parsing failed, give pretty traceback
                    for d in exc.diagnostics.exceptions:
                        yield set_location(replace(d, file=mc.database.current), node.value)
                    return replace(node, value="{}")

                ## TEMP - trial on yielding children rather than using invoke				
                # with self.use_diagnostics(captured_diagnostics:=DiagnosticCollection()):
                # 	nbt = yield nbt # run all rules on child-node
                # print(captured_diagnostics.exceptions)
                # print(nbt)
                # new_node = replace(node, value=AstJsonValue(value=mc.serialize(nbt, type=AstNbtCompound)))

                with self.use_diagnostics(captured_diagnostics:=DiagnosticCollection()):
                    processed_nbt = mc.serialize(self.invoke(nbt, type=AstNbtCompound))
                for exc in captured_diagnostics.exceptions:
                    yield propagate_location(exc, node.value)  # set error location to nbt key-value that caused the problem and pass diagnostic back to mecha

                new_node = replace(node, value=AstJsonValue(value=processed_nbt))
                if new_node != node:
                    return new_node
                
        return node

def propagate_location(obj: T, parent_location_obj: Any) -> T:
    """a set_location like function propagating diagnostic information for manually invoked rules"""
    return set_location(obj, 
        SourceLocation(pos=parent_location_obj.location.pos+obj.location.pos, lineno=parent_location_obj.location.lineno, colno=parent_location_obj.location.colno+obj.location.colno), # type: ignore
        SourceLocation(pos=parent_location_obj.location.pos+obj.end_location.pos, lineno=parent_location_obj.location.lineno, colno=parent_location_obj.location.colno+obj.end_location.colno) # type: ignore
    )

# CSV READING UTILS
class CSVCell(str):
    """
    String wrapper for contents of a CSVCell, supports interpreting the content as different formats.
    """

    DEC = 'dec'  # for numbers formatted 16777215
    HEX = 'hex'  # for numbers formatted #AB0EFF
    FLOAT = 'float'  # for numbers formatted [0.5, 0.2, 0.9]

    def as_integer(self) -> int:
        """
        Interprets the string contained in this CSVCell as an integer.
        Supported formats are:
            - base 10 integers (no prefix)
            - prefixed hex color codes (# prefix and 6 digits)
            - prefixed hex, octal, or binary (0x, 0o, or 0b and some amount of digits)
            - bool (True or False, case insensitive)
        Returns a integer representation of the value.
        """
        if self.startswith('#') and len(self) == 7:  # alternative way of marking base 16 (hex colors)
            return CSVCell('0x' + self.lstrip('#')).as_integer()
        if self.startswith('0x'):  # check if the string is in base 2
            return int(self, 16)
        if self.startswith('0o'):  # check if the string is in base 8
            return int(self, 8)
        if self.startswith('0b'):  # check if the string is in base 16
            return int(self, 2)
        if self.casefold() == 'true':
            return 1
        if self.casefold() == 'false':
            return 0
        return int(self)  # default case, interpret as base 10
    
    def as_bool(self) -> bool:
        """
        Interprets the string contained in this CSVCell as a boolean.
        Returns `True` if the cell's content is:
            - `TRUE` in any capitalization
            - A positive number greater or equal to `1`
        Returns `False` if the cell's content is:
            - `FALSE` in any capitalization
            - `0` or any number that truncates to zero
        Raises a `ValueError` in all other cases.
        """
        match self.casefold():
            case 'true':  # TRUE / FALSE keywords
                return True
            case 'false':
                return False
            case other:
                try:  # test if contents can be parsed as a number
                    other = int(other)
                    if 0 <= other:  # only positive numbers can be interpreted as a boolean
                        return 1 <= other
                except ValueError:
                    pass  # not a number
                raise ValueError(f"Couldn't interpret CSVCell contents ('{self}') as a boolean.")
        
    def to_color_code(self, encoding: str) -> 'CSVCell':
        """
        Interprets the string contained in this CSVCell as a color code using the given encoding and returns a new CSVCell with that interpretation as its content.
        E.g. if the CSVCell this function was called on contains '#4AA0C7' and 'CSVCell.DEC' is given as an encoding, a new CSVCell with content '4890823' is returned.
        """
        if encoding == CSVCell.HEX:
            return CSVCell('#' + hex(self.as_integer()).lstrip('0x'))
        if encoding == CSVCell.DEC:
            return CSVCell(self.as_integer())
        if encoding == CSVCell.FLOAT:
            dec = self.as_integer()
            return CSVCell([(dec >> 16) / 255, ((dec >> 8) & 0xFF) / 255, (dec & 0xFF) / 255])
        raise ValueError(
            f"Invalid encoding '{encoding}'. Must be '{CSVCell.DEC}', '{CSVCell.HEX}', or '{CSVCell.FLOAT}'.")


class CSVRow():
    """
    Read-only dict wrapper which represents a row of data from a .csv file.
    """

    def __init__(self, column_names: List[str] | None = None, data: List[CSVCell] | None = None) -> None:
        """
        Initialize a new CSVRow object using the supplied column names and data. CSVRow objects are read-only by design.
        If no data and no column names are supplied the resulting CSVRow object will evaluate to false in boolean expressions.

        Access data within this CSVRow via the `get(key, default)` method or using `[<key: str>]`.
        """
        if not column_names:
            column_names = []
        if not data:
            data = []

        if len(column_names) != len(data):
            raise ValueError(
                f"Could not build CSVRow from supplied column names and data; Number of supplied column names ({len(column_names)}) does not match number of supplied data entries ({len(data)}).")

        self._data = {column_names[column_index]
            : value for column_index, value in enumerate(data)}

    def __bool__(self):
        """
        Allow for the use of CSVRow instances in if statements; If the CSVRow has no keys it is equivalent to `False`.
        """
        return len(self._data.keys()) != 0

    def __getitem__(self, key: str):
        try:
            return self._data[key]
        except KeyError as ke:
            raise ValueError(
                f"Failed to select column named '{ke.args[0]}' from CSVRow with columns {[key for key in self._data]}.")

    def __repr__(self) -> str:
        return str(self._data)

    def get(self, key: str, default: str | Any) -> CSVCell:
        """
        Returns the value corresponding to the key if it exists and is not the empty string.
        Else returns the provided default. The provided default is cast to a string internally.
        """
        value = self._data.get(key, CSVCell(default))
        if value:
            return value
        else:
            return CSVCell(default)


class CSV():
    """
    List-of-Rows representation of a .csv file which can be iteraded over using for ... in.
    Optimized for row-first access, i.e. select a row, then a column.
    Also provides a `find_row` function for column-first, i.e. select a column, then a row, access.
    However, the latter is is more expensive.

    All access methods return CSVRow objects which are dynamically created upon calling an access method.
    """

    @staticmethod
    def from_file(path: Path) -> 'CSV':
        """
        Reads in a csv file and returns a list of rows. Each row consists of a dictionary which contains labeled values.
        """
        with open(path, mode='r') as file:
            csv_file = csv.reader(file)
            header = next(csv_file)

            return CSV(column_names=header, rows=[[CSVCell(cell) for cell in row] for row in csv_file])

    def __init__(self, column_names: List[str], rows: List[List[CSVCell]]) -> None:
        """
        Initialize a new CSV from a list of column names (headers) and a list of rows.
        The latter contain actual data, whilst the former only holds names of columns.
        """
        self._column_names = column_names
        self._rows = rows

    def __iter__(self):
        "Iterate over `CSVRow` objects contained within this `CSV`. Traverses in order, starting with the topmost row."
        self.__current = 0
        self.__last = len(self._rows)
        return self

    def __next__(self) -> CSVRow:
        current = self.__current
        self.__current += 1
        if current < self.__last:
            return CSVRow(self._column_names, self._rows[current])
        raise StopIteration()

    def __getitem__(self, row_index: int):
        return CSVRow(self._column_names, self._rows[row_index])

    def __repr__(self):
        return str([CSVRow(self._column_names, data) for data in self._rows])

    def find_row(self, value: str, by_column: str | int = 0) -> CSVRow:
        """
        Finds and returns the first row in this CSV which has `value` in column `by_column`. `by_column` can either be a str, in which case it is treated
        as a column name and the header line is searched for a matching string, or an int n, in which case the nth column is selected.
        `by_column` defaults to `0`.
        Returns an empty `CSVRow` if no match was found.
        """
        if isinstance(by_column, str):
            by_column = self._column_names.index(by_column)

        for row in self._rows:
            if row[by_column] == value:
                return CSVRow(self._column_names, row)
        return CSVRow()
