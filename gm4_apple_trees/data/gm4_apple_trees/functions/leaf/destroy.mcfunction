# removes a ripe apple leaf armor stand if it is not inside a leaf anymore
# @s = gm4_ripe_apple armor stand that's holding an apple
# located at @s align xyz
# run from gm4_apple_trees:leaf/process

# drop sapling
loot spawn ~ ~ ~ loot gm4_apple_trees:blocks/apple_tree_leaf
# kill apple armor stands
execute as @e[type=armor_stand,distance=..3,tag=gm4_apple,tag=!gm4_ripe_apple] at @s unless block ~ ~1 ~ minecraft:oak_leaves run kill @s
execute as @e[type=armor_stand,distance=..3,tag=gm4_apple,tag=gm4_ripe_apple] at @s unless block ~ ~2 ~ minecraft:oak_leaves run function gm4_apple_trees:leaf/apple/destroy

# kill
kill @s
