# age a single mob with the calculated chance
# @s = none
# located at world spawn
# run from aging/age_mobs

# get random value
summon marker ~ ~ ~ {CustomName:'"gm4_everstone_random"',Tags:["gm4_everstone_random"]}
execute store result score $random gm4_es_data run data get entity @e[type=marker,tag=gm4_everstone_random,distance=0,limit=1] UUID[3]
kill @e[type=marker,tag=gm4_everstone_random]

# age one mob, if random value is within the chance
execute if score $random gm4_es_data < $age_count gm4_es_data as @e[type=#gm4_everstone:aging_mob,tag=!gm4_everstone_locked,tag=!gm4_everstone_ignore,tag=!smithed.entity,limit=1,sort=random] at @s run function gm4_everstone:aging/update_age/check_mob
