import re
import logging
from typing import Any, Tuple, Callable
from beet import Context, Pack, TextFileBase, Recipe, Function, NamespaceFile
from beet.core.utils import SupportedFormats
from gm4.plugins.resource_pack import GM4ResourcePack

logger = logging.getLogger("gm4.backwards")

# Generates overlays to support older versions
def beet_default(ctx: Context):
  yield

  # backporting to 1.21.3 (57)
  backport(ctx.data, 57, rewrite_furnace_nbt)
  backport(ctx.data, 57, rewrite_custom_model_data)

  # backporting to 1.21.1 (48)
  backport(ctx.data, 48, rewrite_attributes)
  backport(ctx.data, 48, rewrite_recipe)

  yield from resource_pack(ctx) # bypass the yield clause, since we're already in the exit phase

# Create old resource pack assets for 1.21.3, used standalone for libraries
def resource_pack(ctx: Context):
  yield
  rp = ctx.inject(GM4ResourcePack)

  # use a draft generator to ensure merge rules are followed
  with ctx.generate.draft() as draft:
    overlay = draft.assets.overlays[f"backport_57"]
    overlay.supported_formats = { "min_inclusive": 0, "max_inclusive": 57 }
    rp.generate_model_overrides_1_21_3(overlay)

  # TODO NOTE
  # call the old RP code from here, for clarity and sense - requires handling for 
  # sub packs AKA libraries. Wrap 1.21.3- rp code in a generate.draft to ensure proper
  # merge rules apply. Note outdated methods of rp-plugin.


FURNACE_RENAMES = {
  "cooking_time_spent": "CookTime",
  "cooking_total_time": "CookTimeTotal",
  "lit_time_remaining": "BurnTime",
  "lit_total_time": None,
}

def rewrite_furnace_nbt(id: str, resource: NamespaceFile):
  if not isinstance(resource, Function):
    return None
  text = resource.text
  for src_field, overlay_field in FURNACE_RENAMES.items():
    if overlay_field is None:
      if re.match("\\b" + src_field + "\\b", text):
        logger.error(f"Cannot backport furnace field {src_field} in function {id}")
    else:
      text = re.sub("\\b" + src_field + "\\b", overlay_field, text)
  if text == resource.text:
    return None
  overlay = resource.copy()
  overlay.text = text
  return overlay


def rewrite_custom_model_data(id: str, resource: NamespaceFile):
  if not isinstance(resource, TextFileBase):
    return None
  text = resource.text
  text = re.sub(r"\{\s*[\"']?floats[\"']?\s*:\s*\[\s*(\d+)[Ff]?\s*\]\s*\}", r"\1", text)
  if text == resource.text:
    return None
  overlay = resource.copy()
  overlay.text = text
  return overlay


ATTRIBUTES_RENAMES = {
  "minecraft:armor": "minecraft:generic.armor",
  "minecraft:armor_toughness": "minecraft:generic.armor_toughness",
  "minecraft:attack_damage": "minecraft:generic.attack_damage",
  "minecraft:attack_knockback": "minecraft:generic.attack_knockback",
  "minecraft:attack_speed": "minecraft:generic.attack_speed",
  "minecraft:block_break_speed": "minecraft:player.block_break_speed",
  "minecraft:block_interaction_range": "minecraft:player.block_interaction_range",
  "minecraft:burning_time": "minecraft:generic.burning_time",
  "minecraft:explosion_knockback_resistance": "minecraft:generic.explosion_knockback_resistance",
  "minecraft:entity_interaction_range": "minecraft:player.entity_interaction_range",
  "minecraft:fall_damage_multiplier": "minecraft:generic.fall_damage_multiplier",
  "minecraft:flying_speed": "minecraft:generic.flying_speed",
  "minecraft:follow_range": "minecraft:generic.follow_range",
  "minecraft:gravity": "minecraft:generic.gravity",
  "minecraft:jump_strength": "minecraft:generic.jump_strength",
  "minecraft:knockback_resistance": "minecraft:generic.knockback_resistance",
  # We only use "minecraft:luck" as a potion/effect, never as attribute
  # "minecraft:luck": "minecraft:generic.luck",
  "minecraft:max_absorption": "minecraft:generic.max_absorption",
  "minecraft:max_health": "minecraft:generic.max_health",
  "minecraft:mining_efficiency": "minecraft:player.mining_efficiency",
  "minecraft:movement_efficiency": "minecraft:generic.movement_efficiency",
  "minecraft:movement_speed": "minecraft:generic.movement_speed",
  "minecraft:oxygen_bonus": "minecraft:generic.oxygen_bonus",
  "minecraft:safe_fall_distance": "minecraft:generic.safe_fall_distance",
  "minecraft:scale": "minecraft:generic.scale",
  "minecraft:sneaking_speed": "minecraft:player.sneaking_speed",
  "minecraft:spawn_reinforcements": "minecraft:zombie.spawn_reinforcements",
  "minecraft:step_height": "minecraft:generic.step_height",
  "minecraft:submerged_mining_speed": "minecraft:player.submerged_mining_speed",
  "minecraft:sweeping_damage_ratio": "minecraft:player.sweeping_damage_ratio",
  "minecraft:water_movement_efficiency": "minecraft:generic.water_movement_efficiency",
}

# Removes the generic. and other prefixes from attribute IDs
def rewrite_attributes(id: str, resource: NamespaceFile):
  if not isinstance(resource, TextFileBase):
    return None
  text = resource.text
  for src_attribute, overlay_attribute in ATTRIBUTES_RENAMES.items():
    text = re.sub("\\b" + src_attribute + "\\b", overlay_attribute, text)
  if text == resource.text:
    return None
  overlay = resource.copy()
  overlay.text = text
  return overlay


# Rewrites the recipe ingredients to the old {"item": "..."} format
def rewrite_recipe(id: str, resource: NamespaceFile):
  if not isinstance(resource, Recipe):
    return None
  
  def rewrite_ingredient(ingr: str | list[str]) -> Any:
    if isinstance(ingr, list):
      return [rewrite_ingredient(item) for item in ingr]
    if ingr.startswith("#"):
      return { "tag": ingr[1:] }
    return { "item": ingr }

  overlay = resource.copy()
  data = overlay.data

  if "crafting_transmute" in data["type"]:
    logger.warning(f"Cannot backport crafting_transmute recipe {id}")
    return None

  if "base" in data:
    data["base"] = rewrite_ingredient(data["base"])
  if "addition" in data:
    data["addition"] = rewrite_ingredient(data["addition"])
  if "ingredient" in data:
    data["ingredient"] = rewrite_ingredient(data["ingredient"])
  if "ingredients" in data:
    data["ingredients"] = [rewrite_ingredient(ingr) for ingr in data["ingredients"]]
  if "key" in data:
    data["key"] = {k: rewrite_ingredient(ingr) for k, ingr in data["key"].items()}

  return overlay


def backport(pack: Pack[Any], format: int, run: Callable[[str, NamespaceFile], NamespaceFile | None]):
  resources: dict[Tuple[type[NamespaceFile], str], NamespaceFile] = dict()

  for file_type in pack.resolve_scope_map().values():
    proxy = pack[file_type]
    for path in proxy.keys():
      resources[(file_type, path)] = proxy[path]

  for overlay in pack.overlays.values():
    overlay_formats = overlay.supported_formats or overlay.pack_format
    if check_formats(overlay_formats, format):
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
      overlay.supported_formats = { "min_inclusive": 0, "max_inclusive": format }
      overlay[path] = new_resource


def check_formats(supported: SupportedFormats, format: int):
  match supported:
    case int(value):
      return value == format
    case [min, max]:
      return min <= format <= max
    case { "min_inclusive": min, "max_inclusive": max }:
      return min <= format <= max
    case _:
      raise ValueError(f"Unknown supported)formats structure {supported}")
