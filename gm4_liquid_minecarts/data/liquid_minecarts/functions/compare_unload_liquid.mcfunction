#run from try_to_unload
#@s = liquid minecart containing a liquid with a liquid tank containing liquid below it
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_liquid_minecart_compare"],Duration:1}
data modify entity @e[type=area_effect_cloud,limit=1,sort=nearest,tag=gm4_liquid_minecart_compare] CustomName set from block ~ ~ ~ CustomName
execute if score @e[type=armor_stand,tag=gm4_liquid_tank,limit=1,sort=nearest] gm4_lt_value < @e[type=armor_stand,tag=gm4_liquid_tank,limit=1,sort=nearest] gm4_lt_max store success score @s gm4_lm_data run data modify entity @e[type=area_effect_cloud,limit=1,sort=nearest,tag=gm4_liquid_minecart_compare] CustomName set from entity @s CustomName
execute if score @e[type=armor_stand,tag=gm4_liquid_tank,limit=1,sort=nearest] gm4_lt_value < @e[type=armor_stand,tag=gm4_liquid_tank,limit=1,sort=nearest] gm4_lt_max if score @s gm4_lm_data matches 0 run function liquid_minecarts:unload_liquid
