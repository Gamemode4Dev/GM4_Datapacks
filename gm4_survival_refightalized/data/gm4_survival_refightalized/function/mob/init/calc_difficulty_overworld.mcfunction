# calc base difficulty for this mob and any spawns that originate from it
# @s = mobs that can be buffed
# at @s
# run from mob/init/check_mob

# use world difficulty to set base difficulty 5/10/20
execute store result score $worlddiff gm4_sr_data run difficulty
execute if score $worlddiff gm4_sr_data matches 3 run scoreboard players set $difficulty_base gm4_sr_data 20
execute if score $worlddiff gm4_sr_data matches 2 run scoreboard players set $difficulty_base gm4_sr_data 10
execute unless score $worlddiff gm4_sr_data matches 2..3 run scoreboard players set $difficulty_base gm4_sr_data 5

# not underground + raining +10
execute if predicate gm4_survival_refightalized:technical/raining run scoreboard players add $difficulty_base gm4_sr_data 10
# not underground + thundering (will also add the raining modifier) +15
execute if predicate gm4_survival_refightalized:technical/thundering run scoreboard players add $difficulty_base gm4_sr_data 15
# not underground + nighttime +0-20 based on moon phase (0 at new moon, 20 at full moon)
scoreboard players operation $moon_diff_add gm4_sr_data = $moon gm4_sr_data
scoreboard players operation $moon_diff_add gm4_sr_data *= #5 gm4_sr_data
execute unless predicate gm4_survival_refightalized:mob/underground if predicate gm4_survival_refightalized:technical/night_time run scoreboard players operation $difficulty_base gm4_sr_data += $moon_diff_add gm4_sr_data

# get depth the mob spawned at based on motion_blocking_no_leaves, subtract 16 to shift curve
execute positioned over motion_blocking_no_leaves summon marker run function gm4_survival_refightalized:mob/init/get_world_surface
execute store result score $mob_depth gm4_sr_data run data get entity @s Pos[1]
scoreboard players operation $mob_depth gm4_sr_data -= $world_surface gm4_sr_data
scoreboard players remove $mob_depth gm4_sr_data 16
scoreboard players operation $mob_depth gm4_sr_data > #-128 gm4_sr_data 
scoreboard players operation $mob_depth gm4_sr_data < #0 gm4_sr_data

# underground quadratic increase +0-80 based on mob depth
scoreboard players operation $mob_depth gm4_sr_data *= $mob_depth gm4_sr_data
scoreboard players operation $mob_depth gm4_sr_data *= #5 gm4_sr_data
scoreboard players operation $mob_depth gm4_sr_data /= #1024 gm4_sr_data
execute if predicate gm4_survival_refightalized:mob/underground if score $mob_depth gm4_sr_data matches 1.. run scoreboard players operation $difficulty_base gm4_sr_data += $mob_depth gm4_sr_data

# the rest of this function will also run for any additional spawns
function gm4_survival_refightalized:mob/init/initiate
