# slow clock to handle mob aging
# @s = none
# located at world spawn
# run from init

schedule function gm4_everstone:aging_clock 30s

# calculate number of mobs that should get aged; caps at 1000 counted mobs (100 iterations, spread over 25 seconds)
execute store result score $age_count gm4_es_data if entity @e[type=#gm4_everstone:aging_mob,tag=!gm4_everstone_locked,tag=!gm4_everstone_ignore,tag=!smithed.entity,limit=1000]
scoreboard players operation $age_count gm4_es_data *= #chance gm4_es_data

# age mobs
execute if score $age_count gm4_es_data matches 1.. run function gm4_everstone:aging/age_mobs
