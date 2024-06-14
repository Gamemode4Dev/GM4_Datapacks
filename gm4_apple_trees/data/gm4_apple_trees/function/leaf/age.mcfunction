# decreases the age of a fruiting leaf. If it hits 0, the expansion will have to perform some stage change (e.g. grow fruit bigger or drop fruit)
# @s = gm4_fruiting_leaf marker
# located at world spawn
# run from gm4_apple_trees:slow_clock

# increases age
scoreboard players add @s gm4_fruit_age 1
execute if score @s gm4_fruit_age >= @s gm4_fruit_stage at @s align xyz run function gm4_apple_trees:leaf/advance_stage
