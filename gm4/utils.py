import subprocess
import warnings
from dataclasses import dataclass
from typing import Any
from functools import total_ordering

def run(cmd: list[str]|str) -> str:
	"""Run a shell command and return the stdout."""
	return subprocess.run(cmd, capture_output=True, encoding="utf8", shell=True).stdout.strip()

def X_int(val: str) -> int | None:
	"""Int casting that accepts character 'X' and returns None"""
	return None if val.lower() == 'x' else int(val)

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
		if isinstance(other, Version):
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
