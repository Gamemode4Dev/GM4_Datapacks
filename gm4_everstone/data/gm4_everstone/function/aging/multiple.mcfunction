# age a single mob, then reiterate
# @s = none
# located at world spawn
# run from aging/age_mobs

# age one mob
execute as @e[type=#gm4_everstone:aging_mob,tag=!gm4_everstone_locked,tag=!gm4_everstone_ignore,tag=!smithed.entity,limit=1,sort=random] at @s run function gm4_everstone:aging/update_age/check_mob

# reiterate
scoreboard players remove $age_count gm4_es_data 100
schedule function gm4_everstone:aging/age_mobs 5t
