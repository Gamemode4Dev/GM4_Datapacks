# clear existing tags, check if the player is on a snowy block, add the tag back if yes
# @s = player
# at @s
# run from main

execute unless block ~ ~-0.1 ~ minecraft:air run tag @s remove gm4_mountaineering_skiing

execute if block ~ ~ ~ minecraft:snow if predicate gm4_mountaineering:wearing_skis run tag @s add gm4_mountaineering_skiing
execute if predicate gm4_mountaineering:on_snowy_block if predicate gm4_mountaineering:wearing_skis run tag @s add gm4_mountaineering_skiing
