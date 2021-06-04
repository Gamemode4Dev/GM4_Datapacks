# Called by Liquid Tank's item_drain.json function tag

# new smart interface handles the logic for whether there is enough space in the tank interrupts if not enough

execute if entity @s[tag=gm4_lt_zauber_harming_potion] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"instant_damage"}}}} run function gm4_zauber_liquids:item_drain/zauber_potion
execute if entity @s[tag=gm4_lt_zauber_healing_potion] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"instant_health"}}}} run function gm4_zauber_liquids:item_drain/zauber_potion
execute if entity @s[tag=gm4_lt_zauber_leaping_potion] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"jump_boost"}}}} run function gm4_zauber_liquids:item_drain/zauber_potion
execute if entity @s[tag=gm4_lt_zauber_poison_potion] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"poison"}}}} run function gm4_zauber_liquids:item_drain/zauber_potion
execute if entity @s[tag=gm4_lt_zauber_regeneration_potion] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"regeneration"}}}} run function gm4_zauber_liquids:item_drain/zauber_potion
execute if entity @s[tag=gm4_lt_zauber_strength_potion] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"strength"}}}} run function gm4_zauber_liquids:item_drain/zauber_potion
execute if entity @s[tag=gm4_lt_zauber_swiftness_potion] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"speed"}}}} run function gm4_zauber_liquids:item_drain/zauber_potion
execute if entity @s[tag=gm4_lt_zauber_wormhole_potion] if data storage gm4_liquid_tanks:temp/tank {input_slot:{id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"wormhole_bottle"}}}} run function gm4_zauber_liquids:item_drain/zauber_wormhole_potion
