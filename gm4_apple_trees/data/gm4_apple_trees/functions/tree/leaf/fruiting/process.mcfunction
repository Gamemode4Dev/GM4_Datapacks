# handles operations on apple leaves
# @s = any gm4_apple_leaf
# at @s align xyz
# run from gm4_apple_trees:main

execute if entity @s[tag=!gm4_ripe_apple] positioned ~ ~1 ~ unless block ~ ~ ~ minecraft:oak_leaves run function gm4_apple_trees:tree/leaf/fruiting/destroy
execute if entity @s[tag=gm4_ripe_apple] positioned ~ ~2 ~ unless block ~ ~ ~ minecraft:oak_leaves run function gm4_apple_trees:tree/leaf/fruiting/destroy
