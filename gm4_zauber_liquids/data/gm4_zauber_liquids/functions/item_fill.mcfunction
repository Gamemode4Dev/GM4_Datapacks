#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

execute if block ~ ~-1 ~ soul_fire run scoreboard players remove @s gm4_lt_value 8
scoreboard players operation past_value gm4_lt_value = @s gm4_lt_value

#harming
execute if score @s[tag=gm4_lt_zauber_harming_potion] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function gm4_zauber_liquids:item_fill/zauber_harming_potion

#healing
execute if score @s[tag=gm4_lt_zauber_healing_potion] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function gm4_zauber_liquids:item_fill/zauber_healing_potion

#leaping
execute if score @s[tag=gm4_lt_zauber_leaping_potion] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function gm4_zauber_liquids:item_fill/zauber_leaping_potion

#poison
execute if score @s[tag=gm4_lt_zauber_poison_potion] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function gm4_zauber_liquids:item_fill/zauber_poison_potion

#regeneration
execute if score @s[tag=gm4_lt_zauber_regeneration_potion] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function gm4_zauber_liquids:item_fill/zauber_regeneration_potion

#speed
execute if score @s[tag=gm4_lt_zauber_swiftness_potion] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function gm4_zauber_liquids:item_fill/zauber_swiftness_potion

#strength
execute if score @s[tag=gm4_lt_zauber_strength_potion] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function gm4_zauber_liquids:item_fill/zauber_strength_potion

#wormhole
execute if score @s[tag=gm4_lt_zauber_wormhole_potion] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function gm4_zauber_liquids:item_fill/zauber_wormhole_potion

execute if block ~ ~-1 ~ soul_fire if score past_value gm4_lt_value = @s gm4_lt_value run scoreboard players add @s gm4_lt_value 8
