#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

execute if entity @s[tag=gm4_lt_water] as @e[type=armor_stand,tag=gm4_liquid_tank_stand,distance=..0.6,limit=1] run function gm4_washing_tanks:wash
