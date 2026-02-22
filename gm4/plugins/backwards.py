import logging
from typing import Any, Tuple, Callable
from beet import Context, Pack, NamespaceFile

logger = logging.getLogger("gm4.backwards")

# Generates overlays to support older versions
def beet_default(ctx: Context):
  yield


def backport(pack: Pack[Any], format: int, run: Callable[[str, NamespaceFile], NamespaceFile | None]):
  resources: dict[Tuple[type[NamespaceFile], str], NamespaceFile] = dict()

  for file_type in pack.resolve_scope_map().values():
    proxy = pack[file_type]
    for path in proxy.keys():
      resources[(file_type, path)] = proxy[path]

  for overlay in pack.overlays.values():
    if check_formats(overlay, format):
      for file_type in overlay.resolve_scope_map().values():
        proxy = overlay[file_type]
        for path in proxy.keys():
          resources[(file_type, path)] = proxy[path]

  for (file_type, path), resource in resources.items():
    try:
      new_resource = run(path, resource)
    except BaseException as e:
      e.add_note(f"Failed to backport[{run.__name__}] {file_type.snake_name} {path}")
      raise e
    if new_resource:
      overlay = pack.overlays[f"backport_{format}"]
      overlay.supported_formats = { "min_inclusive": 1, "max_inclusive": format }
      overlay.min_format = 1
      overlay.max_format = format
      overlay[path] = new_resource


def check_formats(overlay: Pack[Any], format: int):
  if overlay.min_format and overlay.max_format:
    return get_major(overlay.min_format) <= format <= get_major(overlay.max_format)
  if overlay.supported_formats:
    match overlay.supported_formats:
      case int(value):
        return value == format
      case [min, max]:
        return min <= format <= max
      case { "min_inclusive": min, "max_inclusive": max }:
        return min <= format <= max
      case _:
        raise ValueError(f"Unknown supported_formats structure {overlay.supported_formats}")
  if overlay.pack_format:
    return overlay.pack_format == format
  return False


def get_major(format: int | tuple[int] | tuple[int, int]):
  return format if isinstance(format, int) else format[0]
