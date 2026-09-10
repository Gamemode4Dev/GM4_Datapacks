# initializes the apple leaf scores
# @s = gm4_apple item display
# located at world spawn
# run from gm4_apple_trees:main
# and from gm4_apple_trees:sapling/generate_tree

# set scores
scoreboard players set @s gm4_entity_version 3
scoreboard players operation @s gm4_fruit_stage = #stage_0_start gm4_apple_data
scoreboard players operation @s gm4_fruit_age = #stage_2_start gm4_apple_data

# randomly adjust age so all apples don't drop simultaneously
execute store result score $random gm4_fruit_age run random value -3..3
scoreboard players operation @s gm4_fruit_age += $random gm4_fruit_age

tag @s remove gm4_apple_uninitialized
