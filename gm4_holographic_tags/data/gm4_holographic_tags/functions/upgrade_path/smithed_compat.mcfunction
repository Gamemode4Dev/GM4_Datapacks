# updates entities with smithed tags and entity version
# @s = old holographic tag
# located at world spawn
# run from gm4_holographic_tags:main

tag @s add smithed.entity
tag @s add smithed.strict
scoreboard players set @s gm4_entity_version 1
