import re
import logging
from typing import Any
from beet import Context, TextFileBase, Recipe

logger = logging.getLogger("gm4.backwards")

# Generates overlays to support older versions
def beet_default(ctx: Context):
  yield

  rewrite_attributes(ctx)
  rewrite_recipes(ctx)


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
def rewrite_attributes(ctx: Context):
  for id, resource in ctx.data.all():
    if isinstance(resource, TextFileBase):
      resource.source_stop
      overlay_text = resource.text
      for src_attribute, overlay_attribute in ATTRIBUTES_RENAMES.items():
        overlay_text = re.sub("\\b" + src_attribute + "\\b", overlay_attribute, overlay_text)
      if overlay_text != resource.text:
        overlay_resource = resource.copy()
        overlay_resource.text = overlay_text
        overlay = ctx.data.overlays["overlay_48"]
        overlay.supported_formats = { "min_inclusive": 48, "max_inclusive": 48 }
        overlay[id] = overlay_resource


# Rewrites the recipe ingredients to the old {"item": "..."} format
def rewrite_recipes(ctx: Context):
  
  def rewrite_ingredient(ingr: str | list[str]) -> Any:
    if isinstance(ingr, list):
      return [rewrite_ingredient(item) for item in ingr]
    if ingr.startswith("#"):
      return { "tag": ingr[1:] }
    return { "item": ingr }
  
  def rewrite_recipe(id: str, resource: Recipe):
    # If an overlay already exists for this recipe, us the contents of that
    # TODO: generalize this for all rewrite functions and handle multiple overlays
    for overlay in ctx.data.overlays.values():
      if id in overlay.recipes:
        resource = overlay.recipes[id]
        break

    overlay_resource = resource.copy()
    data = overlay_resource.data

    if "crafting_transmute" in data["type"]:
      logger.warning(f"Cannot backport crafting_transmute recipe {id}")
      return

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

    overlay = ctx.data.overlays["overlay_48"]
    overlay.supported_formats = { "min_inclusive": 48, "max_inclusive": 48 }
    overlay[id] = overlay_resource

  for id, resource in ctx.data.recipes.items():
    try:
      rewrite_recipe(id, resource)
    except BaseException as e:
      logger.error(f"Failed to backport recipe {id}: {e}")
