# initializes the apple leaf scores
# @s = gm4_apple item_display
# located at world spawn
# run from gm4_apple_trees:main
# and from gm4_apple_trees:sapling/generate_tree

# set scores
scoreboard players set @s gm4_entity_version 2
scoreboard players operation @s gm4_fruit_stage = #gapple_stage_0_start gm4_apple_data
scoreboard players operation @s gm4_fruit_age = #gapple_stage_2_start gm4_apple_data
scoreboard players operation @s gm4_global_age = $global_fruit_age gm4_global_age

# randomly adjust age so all apples don't drop simultaneously
execute store result score $random gm4_fruit_age run random value -10..10
scoreboard players operation @s gm4_fruit_age += $random gm4_fruit_age

tag @s remove gm4_golden_apple_uninitialized
