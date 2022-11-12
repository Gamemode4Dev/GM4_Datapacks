# clear existing tags, check if the player is on a snowy block and wearing skis, add the skiing tag back if yes, and add ski_off_snow tag if not on snowy block
# @s = player wearing skis
# at @s
# run from skis_equipped

# Remove tags unless the player is in the air
execute unless block ~ ~-0.1 ~ minecraft:air run tag @s remove gm4_mountaineering_skiing
execute unless block ~ ~-0.1 ~ minecraft:air run tag @s remove gm4_mountaineering_skiing_off_snow

# Add skiing tag if on snow layer or any other snowy block (contained within the predicate) with skis
execute if block ~ ~ ~ minecraft:snow run tag @s add gm4_mountaineering_skiing
execute if predicate gm4_mountaineering:on_snowy_block run tag @s add gm4_mountaineering_skiing

# Add a tag for skiing off a snowy block if wearing skis on a non-snowy block
execute unless block ~ ~ ~ minecraft:snow unless predicate gm4_mountaineering:on_snowy_block_or_air run tag @s add gm4_mountaineering_skiing_off_snow
