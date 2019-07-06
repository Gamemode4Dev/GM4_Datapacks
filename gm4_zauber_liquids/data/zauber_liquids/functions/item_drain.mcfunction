#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#healing
execute if score @s[tag=gm4_lt_zauber_healing] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"zauber_potion",potion:"healing"}}}]} run function zauber_liquids:item_drain/potion

#harming
execute if score @s[tag=gm4_lt_zauber_harming] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"zauber_potion",potion:"harming"}}}]} run function zauber_liquids:item_drain/potion

#leaping
execute if score @s[tag=gm4_lt_zauber_leaping] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"zauber_potion",potion:"leaping"}}}]} run function zauber_liquids:item_drain/potion

#poison
execute if score @s[tag=gm4_lt_zauber_poison] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"zauber_potion",potion:"poison"}}}]} run function zauber_liquids:item_drain/potion

#regeneration
execute if score @s[tag=gm4_lt_zauber_regeneration] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"zauber_potion",potion:"regeneration"}}}]} run function zauber_liquids:item_drain/potion

#speed
execute if score @s[tag=gm4_lt_zauber_speed] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"zauber_potion",potion:"speed"}}}]} run function zauber_liquids:item_drain/potion

#strength
execute if score @s[tag=gm4_lt_zauber_strength] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"zauber_potion",potion:"strength"}}}]} run function zauber_liquids:item_drain/potion
