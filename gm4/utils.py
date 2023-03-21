import subprocess
import warnings
from dataclasses import dataclass

def run(cmd: list[str]) -> str:
	"""Run a shell command and return the stdout."""
	return subprocess.run(cmd, capture_output=True, encoding="utf8").stdout.strip()

def X_int(val: str) -> int | None:
	"""Int casting that accepts character 'X' and returns None"""
	return None if val.lower() == 'x' else int(val)

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