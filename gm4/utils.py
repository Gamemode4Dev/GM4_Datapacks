import subprocess

def run(cmd: list[str]) -> str:
	"""Run a shell command and return the stdout."""
	return subprocess.run(cmd, capture_output=True, encoding="utf8").stdout.strip()

def semver_to_int(version: str) -> int:
	"""converts a semver string into a integer, for use in module scoreboards"""
	return sum(map(lambda x,y: int(x)*y, version.split("."), (100_000, 1_000, 1)))

def semver_to_dict(version: str) -> dict[str, int | None]:
	"""converts a semver string into a dict with each of its components"""
	return dict(zip(("major", "minor", "patch"), map(X_int, version.split("."))))

def X_int(val: str) -> int | None:
	"""Int casting that accepts character 'X' and returns None"""
	return None if val.lower() == 'x' else int(val) # FIXME propagate to the rest of the code