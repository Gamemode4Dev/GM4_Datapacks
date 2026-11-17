# decreases the age of a fruiting leaf. If it hits 0, the expansion will have to perform some stage change (e.g. grow fruit bigger or drop fruit)
# @s = gm4_fruiting_leaf marker
# located at world spawn
# run from gm4_apple_trees:slow_clock

# increases age
scoreboard players add @s gm4_fruit_age 1
scoreboard players add @s gm4_global_age 1

# process jumps in age from being unloaded
scoreboard players operation $age_diff gm4_apple_data = $global_fruit_age gm4_global_age
scoreboard players operation $age_diff gm4_apple_data -= @s gm4_global_age
scoreboard players operation @s gm4_fruit_age += $age_diff gm4_apple_data

# time skips cap at either go no->unripe, no/unripe->ripe or ripe->dropped
    # if skipping to baby apple, keep progress toward ripe
execute if score $age_diff gm4_apple_data matches 1.. if score @s gm4_fruit_age > #gapple_stage_1_start gm4_apple_data if score @s gm4_fruit_age < #gapple_stage_2_start gm4_apple_data run function gm4_golden_apple_trees:leaf/set_stage/1

    # if skipping to full grown, stop progress at first tick of full grown
execute if score $age_diff gm4_apple_data matches 1.. if score @s gm4_fruit_stage = #gapple_stage_2_start gm4_apple_data run scoreboard players operation @s gm4_fruit_age < #gapple_stage_2_start gm4_apple_data

    # if skipping to dropped, stop progress at first tick of dropped
execute if score $age_diff gm4_apple_data matches 1.. if score @s gm4_fruit_stage = #gapple_stage_0_start gm4_apple_data run scoreboard players operation @s gm4_fruit_age < #gapple_stage_0_start gm4_apple_data

# update display
execute if score @s gm4_fruit_age >= @s gm4_fruit_stage at @s run function gm4_golden_apple_trees:leaf/advance_stage

# sync with global age
scoreboard players operation @s gm4_global_age = $global_fruit_age gm4_global_age
