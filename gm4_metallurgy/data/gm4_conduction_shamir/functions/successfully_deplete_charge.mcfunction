# @s = players holding conduction tool till the effect reached 0, having dealt enough damage. Runs only once.
# at @s
# ran from conduction_shamir:main

#summon new raycast point and align it with looking vector of player
summon area_effect_cloud ~ ~ ~ {Duration:200,CustomName:"\"gm4_conduction_raycast_point\"",Tags:["gm4_conduction_raycast_point"]}
tp @e[type=area_effect_cloud,tag=gm4_conduction_raycast_point,distance=..2,limit=1] @s
execute as @e[type=area_effect_cloud,tag=gm4_conduction_raycast_point,limit=1] at @s run tp @s ~ ~1 ~

#notify pulse check
scoreboard players set conduction_raycast gm4_ml_data 1

#reset scores to recharge tool
scoreboard players reset @s gm4_volt_damage
scoreboard players set @s gm4_volt_time -2
