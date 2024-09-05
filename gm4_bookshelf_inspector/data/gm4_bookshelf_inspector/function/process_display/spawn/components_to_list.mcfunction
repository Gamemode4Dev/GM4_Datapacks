# converts new 1.20.5 stored enchantment component structure to a previous format of a list of {id:,lvl:}
  ## NOTE: a more substantial rewrite may be possible in the future if we get a way to iterate over the nbt keys dynamically
  # keeping this format enables most of the module to remain intact for the 1.20.5 update quickly, though may be less efficient overall

# @s = text display
# at chiseled bookshelf, selected book slot
# run from process_display/spawn/list_enchantments

data modify storage gm4_bookshelf_inspector:temp enchantments set value []

ALL_ENCHANTMENTS = [
    "binding_curse",
    "vanishing_curse",
    "riptide",
    "channeling",
    "wind_burst",
    "frost_walker",
    "sharpness",
    "smite",
    "bane_of_arthropods",
    "impaling",
    "power",
    "density",
    "breach",
    "piercing",
    "sweeping_edge",
    "multishot",
    "fire_aspect",
    "flame",
    "knockback",
    "punch",
    "protection",
    "blast_protection",
    "fire_protection",
    "projectile_protection",
    "feather_falling",
    "fortune",
    "looting",
    "silk_touch",
    "luck_of_the_sea",
    "efficiency",
    "quick_charge",
    "lure",
    "respiration",
    "aqua_affinity",
    "soul_speed",
    "swift_sneak",
    "depth_strider",
    "thorns",
    "loyalty",
    "unbreaking",
    "infinity",
    "mending"
]

## beet 0.105.0 is missing enchantment tag support. Uncomment in a future version to auto-pull ids from the vanilla jar.
# from beet.contrib.vanilla import Vanilla
# vanilla = ctx.inject(Vanilla).mount("data/minecraft/tags/enchantment/tooltip_order.json")
# ALL_ENCHANTMENTS = vanilla.data.enchantment_tags["minecraft:tooltip_order"].data["values"]

for ench_id in ALL_ENCHANTMENTS:
    execute if data storage gm4_bookshelf_inspector:temp f"levels.\"minecraft:{ench_id}\"" run data modify storage gm4_bookshelf_inspector:temp enchantments append value {id:f"minecraft:{ench_id}"}
    execute if data storage gm4_bookshelf_inspector:temp f"levels.\"minecraft:{ench_id}\"" run data modify storage gm4_bookshelf_inspector:temp enchantments[{id:f"minecraft:{ench_id}"}].lvl set from storage gm4_bookshelf_inspector:temp f"levels.\"minecraft:{ench_id}\""
