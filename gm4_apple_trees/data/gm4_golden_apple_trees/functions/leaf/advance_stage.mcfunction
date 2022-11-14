# advances the stage of the fruit
# @s = apple_fruiting_leaf armor stand
# located at @s align xyz
# run from gm4_apple_trees:leaf/age

# set the visual stage of the fruit depending the score
execute if score @s gm4_fruit_age = #gapple_stage_1_start gm4_apple_data run function gm4_golden_apple_trees:leaf/set_stage/1
execute if score @s gm4_fruit_age = #gapple_stage_2_start gm4_apple_data run function gm4_golden_apple_trees:leaf/set_stage/2
execute if score @s gm4_fruit_age = #gapple_stage_0_start gm4_apple_data run function gm4_golden_apple_trees:leaf/set_stage/0
