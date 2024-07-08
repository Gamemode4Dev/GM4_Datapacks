# calc base difficulty for this mob and any spawns that originate from it
# @s = mobs that can be buffed
# at @s
# run from mob/init/check_mob

# use world difficulty to set base difficulty 0/10/30
execute store result score $worlddiff gm4_ce_data run difficulty
execute if score $worlddiff gm4_ce_data matches 3 run scoreboard players set $difficulty_base gm4_ce_data 30
execute if score $worlddiff gm4_ce_data matches 2 run scoreboard players set $difficulty_base gm4_ce_data 10
execute unless score $worlddiff gm4_ce_data matches 2..3 run scoreboard players set $difficulty_base gm4_ce_data 0

# not in dark + raining +10
execute if predicate gm4_combat_expanded:technical/raining run scoreboard players add $difficulty_base gm4_ce_data 10
# not in dark + thundering (will also add the raining modifier) +25
execute if predicate gm4_combat_expanded:technical/thundering run scoreboard players add $difficulty_base gm4_ce_data 25
# mountainous +15
execute if predicate gm4_combat_expanded:mob/modifier/mountainous run scoreboard players add $difficulty_base gm4_ce_data 15
# night & not in dark biome 0-40 based on moon phase
scoreboard players operation $moon_diff_add gm4_ce_data = $moon gm4_ce_data
scoreboard players operation $moon_diff_add gm4_ce_data *= #10 gm4_ce_data
execute unless predicate gm4_combat_expanded:mob/modifier/dark if predicate gm4_combat_expanded:technical/night_time run scoreboard players operation $difficulty_base gm4_ce_data += $moon_diff_add gm4_ce_data

# dark biome +0-80 based on y level
execute store result score $y_diff_add gm4_ce_data run data get entity @s Pos[1] -1.13
scoreboard players add $y_diff_add gm4_ce_data 10
execute if predicate gm4_combat_expanded:mob/modifier/dark if score $y gm4_ce_data matches 1.. run scoreboard players operation $difficulty_base gm4_ce_data += $y_diff_add gm4_ce_data


function gm4_combat_expanded:mob/init/initiate
