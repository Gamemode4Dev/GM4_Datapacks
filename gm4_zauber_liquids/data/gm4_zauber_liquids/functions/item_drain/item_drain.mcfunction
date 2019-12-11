# Called by Liquid Tank's item_drain.json function tag

# fill tank depending on type
execute if score @s[tag=gm4_lt_zauber_harming_potion] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"instant_damage"}}}]} run function zauber_liquids:item_drain/zauber_potion
execute if score @s[tag=gm4_lt_zauber_healing_potion] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"instant_health"}}}]} run function zauber_liquids:item_drain/zauber_potion
execute if score @s[tag=gm4_lt_zauber_leaping_potion] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"jump_boost"}}}]} run function zauber_liquids:item_drain/zauber_potion
execute if score @s[tag=gm4_lt_zauber_poison_potion] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"poison"}}}]} run function zauber_liquids:item_drain/zauber_potion
execute if score @s[tag=gm4_lt_zauber_regeneration_potion] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"regeneration"}}}]} run function zauber_liquids:item_drain/zauber_potion
execute if score @s[tag=gm4_lt_zauber_strength_potion] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"strength"}}}]} run function zauber_liquids:item_drain/zauber_potion
execute if score @s[tag=gm4_lt_zauber_swiftness_potion] gm4_lt_value matches ..299 if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"speed"}}}]} run function zauber_liquids:item_drain/zauber_potion
