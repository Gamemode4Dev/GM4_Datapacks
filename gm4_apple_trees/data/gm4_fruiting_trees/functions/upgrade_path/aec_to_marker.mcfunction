# converts sapling aec to marker
# @s = old aec sapling marker
# located at @s
# run from gm4_fruiting_trees:tick

summon marker ~ ~0.5 ~ {Tags:["gm4_sapling_new"]}
scoreboard players set @e[type=marker,tag=gm4_sapling_new] gm4_entity_version 1
data modify entity @e[type=marker,tag=gm4_sapling_new,limit=1] CustomName set from entity @s CustomName
tag @s add smithed.entity
tag @s add smithed.strict
tag @s add smithed.block
data modify entity @e[type=marker,tag=gm4_sapling_new,limit=1] Tags set from entity @s Tags
kill @s
