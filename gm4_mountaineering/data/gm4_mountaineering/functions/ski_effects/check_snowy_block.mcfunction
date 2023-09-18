# clear existing tags, check if the player is on a snowy block and wearing skis, add the skiing tag back if yes, and add ski_off_snow tag if not on snowy block
# @s = player wearing skis
# at @s
# run from skis_equipped

# Remove skiing tags and slowness effects unless the player is in the air
execute if entity @s[tag=gm4_mountaineering_ski_slowness] unless block ~ ~-0.1 ~ minecraft:air run function gm4_mountaineering:ski_effects/ski_off_snow_slowness/remove_off_snow_slowness
execute unless block ~ ~-0.1 ~ minecraft:air run tag @s remove gm4_mountaineering_skiing

# Add skiing tag if on snow layer or any other snowy block (contained within the predicate) with skis
execute if block ~ ~ ~ minecraft:snow run tag @s add gm4_mountaineering_skiing
tag @s[predicate=gm4_mountaineering:on_snowy_block] add gm4_mountaineering_skiing

# Add slowness if wearing skis on a non-snowy block
execute if entity @s[tag=!gm4_mountaineering_ski_slowness] unless block ~ ~ ~ minecraft:snow unless predicate gm4_mountaineering:on_snowy_block_or_air run function gm4_mountaineering:ski_effects/ski_off_snow_slowness/add_off_snow_slowness

