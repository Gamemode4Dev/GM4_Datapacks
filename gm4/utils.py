import subprocess
import warnings
from dataclasses import dataclass
from beet import ListOption
from typing import TypeVar, Generic
from pydantic.generics import GenericModel
from pydantic import validator

T = TypeVar('T')

def run(cmd: list[str]) -> str:
	"""Run a shell command and return the stdout."""
	return subprocess.run(cmd, capture_output=True, encoding="utf8").stdout.strip()

def X_int(val: str) -> int | None:
	"""Int casting that accepts character 'X' and returns None"""
	return None if val.lower() == 'x' else int(val)

def add_namespace(val: str, namespace: str) -> str:
	"""Adds a namsepace prefix to a string, if one does not already exist"""
	if ":" not in val:
		return f"{namespace}:{val}"
	return val

@dataclass
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
