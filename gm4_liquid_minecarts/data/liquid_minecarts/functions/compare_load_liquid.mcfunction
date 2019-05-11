#run from try_to_load
#@s = liquid minecart containing a liquid with a liquid tank containing liquid pointed at it

summon area_effect_cloud ~ ~ ~ {Tags:["gm4_liquid_minecart_compare"],Duration:1}
data modify entity @e[type=area_effect_cloud,limit=1,sort=nearest,tag=gm4_liquid_minecart_compare] CustomName set from block ~ ~ ~ CustomName
execute store success score @s gm4_lm_data run data modify entity @e[type=area_effect_cloud,limit=1,sort=nearest,tag=gm4_liquid_minecart_compare] CustomName set from entity @s CustomName
execute if score @s gm4_lm_data matches 0 run function liquid_minecarts:load_liquid
kill @e[type=area_effect_cloud,tag=g4m_liquid_minecart_compare]
