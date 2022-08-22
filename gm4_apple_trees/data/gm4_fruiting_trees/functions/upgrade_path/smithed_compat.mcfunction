# updates entities with smithed tags and entity version
# @s = old sapling marker or old leaf armor stand
# located at @s
# run from gm4_fruiting_trees:main

tag @s add smithed.block
tag @s add smithed.entity
tag @s add smithed.strict
scoreboard players set @s gm4_entity_version 1
