# handles operations on apple leaves
# @s = any gm4_apple_leaf
# at @s align xyz
# run from gm4_apple_trees:main

execute if entity @s[tag=!gm4_ripe_apple] unless block ~ ~1 ~ minecraft:oak_leaves run kill @s
execute if entity @s[tag=gm4_ripe_apple] unless block ~ ~2 ~ minecraft:oak_leaves run function gm4_apple_trees:tree/leaf/fruiting/destroy
