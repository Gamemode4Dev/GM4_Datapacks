#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process


#experience tank
execute if score @s[tag=gm4_lt_experience] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,tag:{Enchantments:[{id:"minecraft:mending"}]}}]} run function gm4_mending_tanks:check_item
