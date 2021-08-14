# handles operations on TREE_TYPE fruit leaves
# @s = any TREE_TYPE fruit leaf
# at @s align xyz positioned at the leaf block
# run from gm4_natural_trees:main

execute if entity @s[tag=!gm4_ripe_apple_fruit] positioned ~ ~1 ~ unless block ~ ~ ~ #minecraft:leaves run function gm4_garden_variety:generation/fruit_leaves/apple/destroy
execute if entity @s[tag=gm4_ripe_apple_fruit] positioned ~ ~2 ~ unless block ~ ~ ~ #minecraft:leaves run function gm4_garden_variety:generation/fruit_leaves/apple/destroy