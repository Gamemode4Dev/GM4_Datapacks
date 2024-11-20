# removes a leaf marker
# @s = gm4_apple_leaf marker
# located at @s
# run from gm4_apple_trees:verify/destroy_leaf

# drop sapling
loot spawn ~ ~ ~ loot gm4_apple_trees:blocks/apple_tree_leaf
# kill apple armor stands
execute as @e[type=armor_stand,distance=..3,tag=gm4_golden_apple,tag=!gm4_ripe_apple] at @s unless block ~ ~1 ~ minecraft:oak_leaves run kill @s
execute as @e[type=armor_stand,distance=..3,tag=gm4_golden_apple,tag=gm4_ripe_apple] at @s align xyz unless block ~ ~2 ~ minecraft:oak_leaves run function gm4_golden_apple_trees:leaf/apple/destroy

# kill
kill @s
