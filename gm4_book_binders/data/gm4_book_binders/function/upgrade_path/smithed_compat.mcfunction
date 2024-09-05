# updates entities with smithed tags and entity version
# @s = old book binder armor stand
# located at world spawn
# run from gm4_book_binders:main

tag @s add smithed.entity
tag @s add smithed.strict
scoreboard players set @s gm4_entity_version 1
