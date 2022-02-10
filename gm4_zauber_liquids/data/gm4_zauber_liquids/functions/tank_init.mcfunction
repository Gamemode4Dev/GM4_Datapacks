#@s = empty liquid tank with item in first slot or entity on top
#run from liquid_tanks:item_process

#zauber leaping
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"jump_boost"}}}} run function gm4_zauber_liquids:liquid_init/leaping

#zauber speed
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"speed"}}}} run function gm4_zauber_liquids:liquid_init/swiftness

#zauber healing
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"instant_health"}}}} run function gm4_zauber_liquids:liquid_init/healing

#zauber harming
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"instant_damage"}}}} run function gm4_zauber_liquids:liquid_init/harming

#zauber poison
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"poison"}}}} run function gm4_zauber_liquids:liquid_init/poison

#zauber regeneration
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"regeneration"}}}} run function gm4_zauber_liquids:liquid_init/regeneration

#zauber strength
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"strength"}}}} run function gm4_zauber_liquids:liquid_init/strength

#zauber wormhole
execute if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"wormhole_bottle"}}}} run function gm4_zauber_liquids:liquid_init/wormhole
