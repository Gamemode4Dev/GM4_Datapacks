#@s = empty liquid tank with item in first slot or entity on top
#run from liquid_tanks:item_process

#zauber leaping
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"zauber_potion",potion:"leaping"}}}]} run function zauber_liquids:liquid_init/leaping

#zauber speed
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"zauber_potion",potion:"speed"}}}]} run function zauber_liquids:liquid_init/speed

#zauber healing
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"zauber_potion",potion:"healing"}}}]} run function zauber_liquids:liquid_init/healing

#zauber harming
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"zauber_potion",potion:"harming"}}}]} run function zauber_liquids:liquid_init/harming

#zauber poison
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"zauber_potion",potion:"poison"}}}]} run function zauber_liquids:liquid_init/poison

#zauber regeneration
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"zauber_potion",potion:"regeneration"}}}]} run function zauber_liquids:liquid_init/regeneration

#zauber strength
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"zauber_potion",potion:"strength"}}}]} run function zauber_liquids:liquid_init/strength
