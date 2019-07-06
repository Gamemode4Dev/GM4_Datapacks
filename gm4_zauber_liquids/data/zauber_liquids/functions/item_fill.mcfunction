#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#harming
execute if score @s[tag=gm4_lt_zauber_harming] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function zauber_liquids:item_fill/zauber_harming_potion

#healing
execute if score @s[tag=gm4_lt_zauber_healing] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function zauber_liquids:item_fill/zauber_healing_potion

#leaping
execute if score @s[tag=gm4_lt_zauber_leaping] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function zauber_liquids:item_fill/zauber_leaping_potion

#poison
execute if score @s[tag=gm4_lt_zauber_poison] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function zauber_liquids:item_fill/zauber_poison_potion

#regeneration
execute if score @s[tag=gm4_lt_zauber_regeneration] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function zauber_liquids:item_fill/zauber_regenration_potion

#speed
execute if score @s[tag=gm4_lt_zauber_speed] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function zauber_liquids:item_fill/zauber_speed_potion

#strength
execute if score @s[tag=gm4_lt_zauber_strength] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function zauber_liquids:item_fill/zauber_strength_potion
