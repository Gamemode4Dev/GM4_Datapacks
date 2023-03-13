import subprocess

def run(cmd: list[str]) -> str:
	"""Run a shell command and return the stdout."""
	return subprocess.run(cmd, capture_output=True, encoding="utf8").stdout.strip()

def semver_to_int(version: str) -> int:
	"""converts a semver string into a integer, for use in module scoreboards"""
	return sum(map(lambda x,y: int(x)*y, version.split("."), (100_000, 1_000, 1)))