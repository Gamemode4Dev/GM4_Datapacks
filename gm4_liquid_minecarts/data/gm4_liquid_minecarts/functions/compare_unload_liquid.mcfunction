#@s = liquid minecart containing a liquid with a liquid tank containing liquid below it
#run from try_to_unload

data modify storage gm4_liquid_minecarts:compare liquid set from entity @e[type=marker,limit=1,sort=nearest,distance=..0.1,tag=gm4_liquid_tank] data.gm4_liquid_tanks.liquid_tag
execute store success score @s gm4_lm_data run data modify storage gm4_liquid_minecarts:compare liquid set from entity @s Passengers[0].ArmorItems[0].tag.gm4_liquid_minecarts.liquid_tag

execute if score @s gm4_lm_data matches 0 run function gm4_liquid_minecarts:unload_liquid
