# randomly selects a tree structure and places it, mimicing jigsaw behavior without location-based random
# @s = apple sapling marker
# located at @s (the sapling)
# run from gm4_apple_trees:sapling/generate_tree

# pick a random tree shape 
# FUTURE NOTE: replace with more performant loot table randomizer when spigot bug is fixed
execute store result score $random gm4_apple_data run data get entity @s UUID[0]
scoreboard players operation $tree_shape gm4_apple_data = $random gm4_apple_data
scoreboard players operation $tree_shape gm4_apple_data %= #8 gm4_apple_data

scoreboard players operation $random gm4_apple_data /= #8 gm4_apple_data
scoreboard players operation $rotation gm4_apple_data = $random gm4_apple_data
scoreboard players operation $rotation gm4_apple_data %= #4 gm4_apple_data

# scoreboard players operation $height

# place the chosen tree
execute if score $tree_shape gm4_apple_data matches 0 if score $rotation gm4_apple_data matches 0 rotated ~ ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_1 ^-2 ^-1 ^-2 none
execute if score $tree_shape gm4_apple_data matches 0 if score $rotation gm4_apple_data matches 1 rotated ~90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_1 ^-2 ^-1 ^-2 clockwise_90
execute if score $tree_shape gm4_apple_data matches 0 if score $rotation gm4_apple_data matches 2 rotated ~180 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_1 ^-2 ^-1 ^-2 180
execute if score $tree_shape gm4_apple_data matches 0 if score $rotation gm4_apple_data matches 3 rotated ~-90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_1 ^-2 ^-1 ^-2 counterclockwise_90

execute if score $tree_shape gm4_apple_data matches 1 if score $rotation gm4_apple_data matches 0 rotated ~ ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_2 ^-2 ^-1 ^-4 none
execute if score $tree_shape gm4_apple_data matches 1 if score $rotation gm4_apple_data matches 1 rotated ~90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_2 ^-2 ^-1 ^-4 clockwise_90
execute if score $tree_shape gm4_apple_data matches 1 if score $rotation gm4_apple_data matches 2 rotated ~180 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_2 ^-2 ^-1 ^-4 180
execute if score $tree_shape gm4_apple_data matches 1 if score $rotation gm4_apple_data matches 3 rotated ~-90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_2 ^-2 ^-1 ^-4 counterclockwise_90

execute if score $tree_shape gm4_apple_data matches 2 if score $rotation gm4_apple_data matches 0 rotated ~ ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_3 ^-2 ^-1 ^-2 none
execute if score $tree_shape gm4_apple_data matches 2 if score $rotation gm4_apple_data matches 1 rotated ~90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_3 ^-2 ^-1 ^-2 clockwise_90
execute if score $tree_shape gm4_apple_data matches 2 if score $rotation gm4_apple_data matches 2 rotated ~180 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_3 ^-2 ^-1 ^-2 180
execute if score $tree_shape gm4_apple_data matches 2 if score $rotation gm4_apple_data matches 3 rotated ~-90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_3 ^-2 ^-1 ^-2 counterclockwise_90

execute if score $tree_shape gm4_apple_data matches 3 if score $rotation gm4_apple_data matches 0 rotated ~ ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_4 ^-2 ^-1 ^-3 none
execute if score $tree_shape gm4_apple_data matches 3 if score $rotation gm4_apple_data matches 1 rotated ~90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_4 ^-2 ^-1 ^-3 clockwise_90
execute if score $tree_shape gm4_apple_data matches 3 if score $rotation gm4_apple_data matches 2 rotated ~180 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_4 ^-2 ^-1 ^-3 180
execute if score $tree_shape gm4_apple_data matches 3 if score $rotation gm4_apple_data matches 3 rotated ~-90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_short_4 ^-2 ^-1 ^-3 counterclockwise_90

execute if score $tree_shape gm4_apple_data matches 4 if score $rotation gm4_apple_data matches 0 rotated ~ ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_1 ^-2 ^-1 ^-2 none
execute if score $tree_shape gm4_apple_data matches 4 if score $rotation gm4_apple_data matches 1 rotated ~90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_1 ^-2 ^-1 ^-2 clockwise_90
execute if score $tree_shape gm4_apple_data matches 4 if score $rotation gm4_apple_data matches 2 rotated ~180 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_1 ^-2 ^-1 ^-2 180
execute if score $tree_shape gm4_apple_data matches 4 if score $rotation gm4_apple_data matches 3 rotated ~-90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_1 ^-2 ^-1 ^-2 counterclockwise_90

execute if score $tree_shape gm4_apple_data matches 5 if score $rotation gm4_apple_data matches 0 rotated ~ ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_2 ^-2 ^-1 ^-4 none
execute if score $tree_shape gm4_apple_data matches 5 if score $rotation gm4_apple_data matches 1 rotated ~90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_2 ^-2 ^-1 ^-4 clockwise_90
execute if score $tree_shape gm4_apple_data matches 5 if score $rotation gm4_apple_data matches 2 rotated ~180 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_2 ^-2 ^-1 ^-4 180
execute if score $tree_shape gm4_apple_data matches 5 if score $rotation gm4_apple_data matches 3 rotated ~-90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_2 ^-2 ^-1 ^-4 counterclockwise_90

execute if score $tree_shape gm4_apple_data matches 6 if score $rotation gm4_apple_data matches 0 rotated ~ ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_3 ^-2 ^-1 ^-2 none
execute if score $tree_shape gm4_apple_data matches 6 if score $rotation gm4_apple_data matches 1 rotated ~90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_3 ^-2 ^-1 ^-2 clockwise_90
execute if score $tree_shape gm4_apple_data matches 6 if score $rotation gm4_apple_data matches 2 rotated ~180 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_3 ^-2 ^-1 ^-2 180
execute if score $tree_shape gm4_apple_data matches 6 if score $rotation gm4_apple_data matches 3 rotated ~-90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_3 ^-2 ^-1 ^-2 counterclockwise_90

execute if score $tree_shape gm4_apple_data matches 7 if score $rotation gm4_apple_data matches 0 rotated ~ ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_4 ^-2 ^-1 ^-3 none
execute if score $tree_shape gm4_apple_data matches 7 if score $rotation gm4_apple_data matches 1 rotated ~90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_4 ^-2 ^-1 ^-3 clockwise_90
execute if score $tree_shape gm4_apple_data matches 7 if score $rotation gm4_apple_data matches 2 rotated ~180 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_4 ^-2 ^-1 ^-3 180
execute if score $tree_shape gm4_apple_data matches 7 if score $rotation gm4_apple_data matches 3 rotated ~-90 ~ run place template gm4_apple_trees:sapling_growth/apple_tree_tall_4 ^-2 ^-1 ^-3 counterclockwise_90

# generate apple leaves
execute as @e[type=marker,tag=gm4_jpool_apple_leaf] if predicate gm4_apple_trees:apple_gen_chance at @s positioned ^ ^ ^1 run function gm4_apple_trees:sapling/grow/generate_random_apple_leaf

# generate corner leaves
execute as @e[type=marker,tag=gm4_jpool_corner_leaf] if predicate gm4_apple_trees:corner_leaf_gen_chance at @s positioned ^ ^ ^1 run setblock ~ ~ ~ oak_leaves[persistent=false,distance=3]

kill @e[type=marker,tag=gm4_jigsaw_marker]