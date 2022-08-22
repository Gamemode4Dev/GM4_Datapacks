# updates entities with smithed tags and entity version
# @s = old chair pig
# located at world spawn
# run from gm4_chairs:main

tag @s add smithed.block
tag @s add smithed.entity
tag @s add smithed.strict
scoreboard players set @s gm4_entity_version 1
