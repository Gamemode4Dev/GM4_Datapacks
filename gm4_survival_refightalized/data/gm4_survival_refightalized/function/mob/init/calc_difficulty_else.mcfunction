# calc base difficulty for this mob and any spawns that originate from it
# @s = mobs that can be buffed
# at @s
# run from mob/init/check_mob

# get the tier from closest player
scoreboard players operation $armor_tier gm4_sr_data = @p gm4_sr_armor.tier

# use world difficulty to set base difficulty 10/25/50
execute store result score $worlddiff gm4_sr_data run difficulty
execute if score $worlddiff gm4_sr_data matches 3 run scoreboard players set $difficulty_base gm4_sr_data 50
execute if score $worlddiff gm4_sr_data matches 2 run scoreboard players set $difficulty_base gm4_sr_data 25
execute unless score $worlddiff gm4_sr_data matches 2..3 run scoreboard players set $difficulty_base gm4_sr_data 10

# add at random 0-80
execute store result score $random_add gm4_sr_data run random value 0..80
scoreboard players operation $difficulty_base gm4_sr_data += $random_add gm4_sr_data

# the rest of this function will also run for any additional spawns
function gm4_survival_refightalized:mob/init/initiate
