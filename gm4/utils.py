import subprocess
import warnings
from dataclasses import asdict, dataclass
from functools import total_ordering
from typing import Any, Generic, TypeVar, Iterator
from dataclasses import replace
from contextlib import contextmanager

from beet import Context, ListOption, LootTable, ItemModifier, Advancement, Predicate
from mecha import Mecha, AbstractNode, AstNbtCompound, AstJsonObjectEntry, AstJsonObjectKey, AstJsonValue, DiagnosticCollection, rule
from tokenstream import set_location, SourceLocation
from pydantic.v1 import validator
from pydantic.v1.generics import GenericModel

T = TypeVar('T')

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
	
	@validator("__root__", pre=True)
	def validate_root(cls, value: list[T]|dict[str,T]|T) -> list[T]|dict[str,T]:
		if value is None:
			value = []
		elif isinstance(value, ListOption):
			value = value.entries()
		if not isinstance(value, (list, tuple, dict)): # single element
			value = [value]
		return value # type: ignore

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
				nbt = mc.parse(node.value.value, type=AstNbtCompound)

				## TEMP - trial on yielding children rather than using invoke				
				# with self.use_diagnostics(captured_diagnostics:=DiagnosticCollection()):
				# 	nbt = yield nbt # run all rules on child-node
				# print(captured_diagnostics.exceptions)
				# print(nbt)
				# new_node = replace(node, value=AstJsonValue(value=mc.serialize(nbt, type=AstNbtCompound)))

				with self.use_diagnostics(captured_diagnostics:=DiagnosticCollection()):
					processed_nbt = mc.serialize(self.invoke(nbt, type=AstNbtCompound))

				for exc in captured_diagnostics.exceptions:
					pos,lineno,colno = node.value.location
					yield set_location(exc, 
						SourceLocation(pos=pos+exc.location.pos, lineno=lineno, colno=colno+exc.location.colno),
						SourceLocation(pos=pos+exc.end_location.pos, lineno=lineno, colno=colno+exc.end_location.colno)
					) # set error location to nbt key-value that caused the problem and pass diagnostic back to mecha

				new_node = replace(node, value=AstJsonValue(value=processed_nbt))
				if new_node != node:
					return new_node
				
		return node
