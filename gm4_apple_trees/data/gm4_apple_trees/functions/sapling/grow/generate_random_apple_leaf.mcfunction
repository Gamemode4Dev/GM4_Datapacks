# generates an apple armor-stand at a random orientation
# @s = gm4_apple_leaf jigsaw marker, created by structure file
# positioned ^ ^ ^1
# run from gm4_apple_trees:sapling/grow/generate_random_tree

# pick a random facing direction shape 
# FUTURE NOTE: replace with more performant loot table randomizer when spigot bug is fixed
execute store result score $random gm4_apple_data run data get entity @s UUID[0]
scoreboard players operation $random gm4_apple_data %= #4 gm4_apple_data

# place apple at given orientation
execute if score $random gm4_apple_data matches 0 run place template gm4_apple_trees:sapling_growth/apple_leaf ~ ~-1 ~ none
execute if score $random gm4_apple_data matches 1 run place template gm4_apple_trees:sapling_growth/apple_leaf ~ ~-1 ~ clockwise_90
execute if score $random gm4_apple_data matches 2 run place template gm4_apple_trees:sapling_growth/apple_leaf ~ ~-1 ~ 180
execute if score $random gm4_apple_data matches 3 run place template gm4_apple_trees:sapling_growth/apple_leaf ~ ~-1 ~ counterclockwise_90