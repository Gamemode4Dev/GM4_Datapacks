#@s = empty liquid tank with item in first slot or entity on top
#run from liquid_tanks:item_process

#zauber leaping
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"jump_boost"}}}]} run function zauber_liquids:liquid_init/leaping

#zauber speed
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"speed"}}}]} run function zauber_liquids:liquid_init/swiftness

#zauber healing
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"instant_health"}}}]} run function zauber_liquids:liquid_init/healing

#zauber harming
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"instant_damage"}}}]} run function zauber_liquids:liquid_init/harming

#zauber poison
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"poison"}}}]} run function zauber_liquids:liquid_init/poison

#zauber regeneration
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"regeneration"}}}]} run function zauber_liquids:liquid_init/regeneration

#zauber strength
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"strength"}}}]} run function zauber_liquids:liquid_init/strength
