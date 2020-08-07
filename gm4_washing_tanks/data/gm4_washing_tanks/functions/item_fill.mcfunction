#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

execute if score @s[tag=gm4_lt_water] gm4_lt_value matches 1.. run function gm4_washing_tanks:wash
