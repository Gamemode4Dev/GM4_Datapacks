# splits the seed the tree was initialized with into bits used for tree generation
# @s = sapling marker area_effect_cloud
# at @s align xyz
# run from gm4_apple_trees:tree/layer/generate

# extract bits
# bit 0
scoreboard players operation $bit0 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit0 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 1
scoreboard players operation $bit1 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit1 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 2
scoreboard players operation $bit2 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit2 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 3
scoreboard players operation $bit3 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit3 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 4
scoreboard players operation $bit4 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit4 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 5
scoreboard players operation $bit5 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit5 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 6
scoreboard players operation $bit6 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit6 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 7
scoreboard players operation $bit7 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit7 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 8
scoreboard players operation $bit8 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit8 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 9
scoreboard players operation $bit9 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit9 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 10
scoreboard players operation $bit10 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit10 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 11
scoreboard players operation $bit11 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit11 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 12
scoreboard players operation $bit12 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit12 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 13
scoreboard players operation $bit13 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit13 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 14
scoreboard players operation $bit14 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit14 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# bit 15
scoreboard players operation $bit15 gm4_tree_seed = $seed gm4_tree_seed
scoreboard players operation $bit15 gm4_tree_seed %= #2 gm4_tree_seed
scoreboard players operation $seed gm4_tree_seed /= #2 gm4_tree_seed

# start generating a tree
function gm4_fruiting_trees:tree/generate
