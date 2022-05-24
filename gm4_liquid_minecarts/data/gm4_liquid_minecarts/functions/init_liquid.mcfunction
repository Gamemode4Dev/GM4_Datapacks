#@s = empty liquid minecart next to a liquid tank pointed at it containing liquid, at tank location
#run from liquid_minecarts:try_to_load

execute anchored feet facing entity @s feet positioned ^ ^ ^1 as @e[type=armor_stand,limit=1,sort=nearest,distance=..1,tag=gm4_liquid_minecart_stand] positioned ^ ^ ^-1 run function gm4_liquid_minecarts:copy_tank_data
tag @s remove gm4_liquid_minecart_empty

#set tank max based on 40% of hopper max
scoreboard players operation @s gm4_lt_max = @e[type=marker,tag=gm4_liquid_tank,limit=1,sort=nearest] gm4_lt_max
scoreboard players operation @s gm4_lt_max /= #5 gm4_lm_data
scoreboard players operation @s gm4_lt_max *= #2 gm4_lm_data

#fill the tank
function gm4_liquid_minecarts:load_liquid
