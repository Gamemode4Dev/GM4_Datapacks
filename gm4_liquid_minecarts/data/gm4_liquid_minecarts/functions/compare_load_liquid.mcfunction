#@s = liquid minecart containing a liquid with a liquid tank containing liquid pointed at it
#run from try_to_load

data modify storage gm4_liquid_minecarts:compare liquid set from entity @e[type=armor_stand,limit=1,sort=nearest,distance=..1,tag=gm4_liquid_tank] ArmorItems[3].tag.gm4_liquid_tanks.liquid_tag
execute store success score @s gm4_lm_data run data modify storage gm4_liquid_minecarts:compare liquid set from entity @s Passengers[0].ArmorItems[0].tag.gm4_liquid_minecarts.liquid_tag

execute if score @s gm4_lm_data matches 0 run function gm4_liquid_minecarts:load_liquid
