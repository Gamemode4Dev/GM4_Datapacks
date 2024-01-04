import os
import subprocess
import warnings
from dataclasses import asdict, dataclass
from functools import total_ordering
from typing import Any, Callable, Generic, TypeVar

from beet import ListOption, Context, LootTable, ItemModifier, Advancement
from mecha import AstNbtCompound, Mecha, CompilationUnit
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
	

def mecha_transform_jsonfiles(ctx: Context, transformer: Any):
	"""Passes nbt contained in advancements, loot_tables ect.. through a custom specified Mecha AST rule"""
	tf = ctx.inject(transformer)
	mc = ctx.inject(Mecha)

	def transform_snbt(snbt: str, db_entry_key: str) -> str:
		escaped_snbt = snbt.replace("\n", "\\\\n")
			# NOTE snbt in loot-tables reacts weird to \n characters. Both \n and \\\\n produce the same ingame output (\\n). 
			# gm4 only has one case of \n in loot tables, so this replacement forces \n->\\\\n for the mecha parser to read it right.
			# this may need to be altered in the future, but for now this means that \\\\n, while valid in vanilla loot-tables, will not
			# work after being put through the mecha parser
		node = mc.parse(escaped_snbt, type=AstNbtCompound) # parse string to AST
		filename = os.path.relpath(jsonfile.original.source_path, ctx.directory) if jsonfile.original.source_path else None # get relative filepath for Diagnostics
		mc.database.update({db_entry_key: CompilationUnit(source=snbt)}) #type:ignore   # register fake CompilationUnit for Diagnostic printing, using unique string as key instead of the File() object, to support multiple entries from the same file
		return mc.serialize(tf.invoke(node, filename=filename, file=db_entry_key)) # run AST through custom rule, and serialize back to string, passing along data for Diagnostic

	for name, jsonfile in [*ctx[LootTable], *ctx[ItemModifier]]:
		# item modifiers, annoyingly, can have a list as the root, so we wrap in a dict to use nested_get
		contents = {"listroot": jsonfile.data} if type(jsonfile.data) is list else jsonfile.data

		for func_list in nested_get(contents, "functions"):
			f: Callable[[Any], bool] = lambda e: e["function"].removeprefix('minecraft:')=="set_nbt"
			for i, entry in enumerate(filter(f, func_list)):
				entry["tag"] = transform_snbt(entry["tag"], db_entry_key=f"{transformer.__name__}:{name}_{i}")

	for name, jsonfile in ctx[Advancement]:
		for i, entry in enumerate(nested_get(jsonfile.data, "icon")):
			entry["nbt"] = transform_snbt(entry["nbt"], db_entry_key=f"{transformer.__name__}:{name}_{i}")

	# send any raised diagnostic errors to Mecha for reporting
	mc.diagnostics.extend(tf.diagnostics)
