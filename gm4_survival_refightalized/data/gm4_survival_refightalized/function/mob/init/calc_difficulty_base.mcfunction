# calc base difficulty for this mob and any spawns that originate from it
# @s = mobs that can be buffed
# at @s
# run from mob/init/check_mob

# get the tier from closest player
scoreboard players operation $armor_tier gm4_sr_data = @p gm4_sr_tier

# use world difficulty to set base difficulty 5/10/20
execute store result score $worlddiff gm4_sr_data run difficulty
execute if score $worlddiff gm4_sr_data matches 3 run scoreboard players set $difficulty_base gm4_sr_data 20
execute if score $worlddiff gm4_sr_data matches 2 run scoreboard players set $difficulty_base gm4_sr_data 10
execute unless score $worlddiff gm4_sr_data matches 2..3 run scoreboard players set $difficulty_base gm4_sr_data 5

# not underground + raining +10
execute if predicate gm4_survival_refightalized:technical/raining run scoreboard players add $difficulty_base gm4_sr_data 10
# not underground + thundering (will also add the raining modifier) +25
execute if predicate gm4_survival_refightalized:technical/thundering run scoreboard players add $difficulty_base gm4_sr_data 25
# night & not underground biome 0-20 based on moon phase
scoreboard players operation $moon_diff_add gm4_sr_data = $moon gm4_sr_data
scoreboard players operation $moon_diff_add gm4_sr_data *= #5 gm4_sr_data
execute unless predicate gm4_survival_refightalized:mob/underground if predicate gm4_survival_refightalized:technical/night_time run scoreboard players operation $difficulty_base gm4_sr_data += $moon_diff_add gm4_sr_data

# underground +0-80 based on y level (reaching max at y=-62)
execute store result score $y_diff_add gm4_sr_data run data get entity @s Pos[1] -1.13
scoreboard players add $y_diff_add gm4_sr_data 10
scoreboard players operation $y_diff_add gm4_sr_data < #80 gm4_sr_data
execute if predicate gm4_survival_refightalized:mob/underground if score $y_diff_add gm4_sr_data matches 1.. run scoreboard players operation $difficulty_base gm4_sr_data += $y_diff_add gm4_sr_data

# the rest of this function will also run for any additional spawns
function gm4_survival_refightalized:mob/init/initiate
