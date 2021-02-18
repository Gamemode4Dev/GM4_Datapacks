# Called by Liquid Tank's item_drain.json function tag

# fill tank depending on type
execute store result score remaining_sips gm4_zl_data run data get block ~ ~ ~ Items[{Slot:0b}].tag.gm4_zauber_cauldrons.bottle.sips 1
execute if score remaining_sips gm4_zl_data matches 0 run scoreboard players set remaining_sips gm4_zl_data 1
scoreboard players set max_capacity_to_fit_potion gm4_zl_data 300
scoreboard players operation max_capacity_to_fit_potion gm4_zl_data -= remaining_sips gm4_zl_data

execute if score @s[tag=gm4_lt_zauber_harming_potion] gm4_lt_value <= max_capacity_to_fit_potion gm4_zl_data if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"instant_damage"}}}]} run function gm4_zauber_liquids:item_drain/zauber_potion
execute if score @s[tag=gm4_lt_zauber_healing_potion] gm4_lt_value <= max_capacity_to_fit_potion gm4_zl_data if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"instant_health"}}}]} run function gm4_zauber_liquids:item_drain/zauber_potion
execute if score @s[tag=gm4_lt_zauber_leaping_potion] gm4_lt_value <= max_capacity_to_fit_potion gm4_zl_data if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"jump_boost"}}}]} run function gm4_zauber_liquids:item_drain/zauber_potion
execute if score @s[tag=gm4_lt_zauber_poison_potion] gm4_lt_value <= max_capacity_to_fit_potion gm4_zl_data if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"poison"}}}]} run function gm4_zauber_liquids:item_drain/zauber_potion
execute if score @s[tag=gm4_lt_zauber_regeneration_potion] gm4_lt_value <= max_capacity_to_fit_potion gm4_zl_data if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"regeneration"}}}]} run function gm4_zauber_liquids:item_drain/zauber_potion
execute if score @s[tag=gm4_lt_zauber_strength_potion] gm4_lt_value <= max_capacity_to_fit_potion gm4_zl_data if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"strength"}}}]} run function gm4_zauber_liquids:item_drain/zauber_potion
execute if score @s[tag=gm4_lt_zauber_swiftness_potion] gm4_lt_value <= max_capacity_to_fit_potion gm4_zl_data if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"potion",type:"speed"}}}]} run function gm4_zauber_liquids:item_drain/zauber_potion
execute if score @s[tag=gm4_lt_zauber_wormhole_potion] gm4_lt_value <= max_capacity_to_fit_potion gm4_zl_data if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_zauber_cauldrons:{item:"wormhole_bottle"}}}]} run function gm4_zauber_liquids:item_drain/zauber_wormhole_potion
