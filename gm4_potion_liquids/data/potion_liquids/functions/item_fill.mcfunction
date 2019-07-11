#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#night_vision
execute if score @s[tag=gm4_lt_night_vision] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/night_vision_potion

#invisibility
execute if score @s[tag=gm4_lt_invisibility] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/invisibility_potion

#leaping
execute if score @s[tag=gm4_lt_leaping] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/leaping_potion

#strong leaping
execute if score @s[tag=gm4_lt_strong_leaping] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/strong_leaping_potion

#fire resistance
execute if score @s[tag=gm4_lt_fire_resistance] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/fire_resistance_potion

#swiftness
execute if score @s[tag=gm4_lt_swiftness] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/swiftness_potion

#strong swiftness
execute if score @s[tag=gm4_lt_strong_swiftness] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/strong_swiftness_potion

#slowness
execute if score @s[tag=gm4_lt_slowness] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/slowness_potion

#strong slowness
execute if score @s[tag=gm4_lt_strong_slowness] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/strong_slowness_potion

#turtle master
execute if score @s[tag=gm4_lt_turtle_master] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/turtle_master_potion

#strong turtle master
execute if score @s[tag=gm4_lt_strong_turtle_master] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/strong_turtle_master_potion

#water breathing
execute if score @s[tag=gm4_lt_water_breathing] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/water_breathing_potion

#healing
execute if score @s[tag=gm4_lt_healing] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/healing_potion

#strong healing
execute if score @s[tag=gm4_lt_strong_healing] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/strong_healing_potion

#harming
execute if score @s[tag=gm4_lt_harming] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/harming_potion

#strong harming
execute if score @s[tag=gm4_lt_strong_harming] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/strong_harming_potion

#poison
execute if score @s[tag=gm4_lt_poison] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/poison_potion

#strong poison
execute if score @s[tag=gm4_lt_strong_poison] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/strong_poison_potion

#regeneration
execute if score @s[tag=gm4_lt_regeneration] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/regeneration_potion

#strong regeneration
execute if score @s[tag=gm4_lt_strong_regeneration] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/strong_regeneration_potion

#strength
execute if score @s[tag=gm4_lt_strength] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/strength_potion

#strong strength
execute if score @s[tag=gm4_lt_strong_strength] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/strong_strength_potion

#weakness
execute if score @s[tag=gm4_lt_weakness] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/weakness_potion

#luck
execute if score @s[tag=gm4_lt_luck] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/luck_potion

#slow falling
execute if score @s[tag=gm4_lt_slow_falling] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/slow_falling_potion

#floating
execute if score @s[tag=gm4_lt_floating] gm4_lt_value matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glass_bottle"}]} run function potion_liquids:item_fill/floating_potion
