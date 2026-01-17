#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

execute if entity @s[tag=gm4_lt_water] run function gm4_washing_tanks:wash
