# check for doublable ores
# @s = smeltery cauldron linked to a furnace that's smelting items
# located at the smeltery block (furnace)
# run from smelt/check_cook_time

# check if the currently smeling item can be doubled
item replace entity @s contents with air
execute unless items block ~ ~ ~ container.0 #gm4_smelteries:can_double run return run tag @e[type=marker,tag=gm4_smeltery_processing,limit=1,distance=..2] remove gm4_smeltery_smelting

# update the cauldron block display
execute if items block ~ ~ ~ container.0 minecraft:gold_ore run item replace entity @s contents with minecraft:gold_ore[custom_model_data={"strings":["gm4_smelteries:block/ore_display/gold_ore"]}]
execute if items block ~ ~ ~ container.0 minecraft:nether_gold_ore run item replace entity @s contents with minecraft:nether_gold_ore[custom_model_data={"strings":["gm4_smelteries:block/ore_display/nether_gold_ore"]}]
execute if items block ~ ~ ~ container.0 minecraft:deepslate_gold_ore run item replace entity @s contents with minecraft:deepslate_gold_ore[custom_model_data={"strings":["gm4_smelteries:block/ore_display/deepslate_gold_ore"]}]
execute if items block ~ ~ ~ container.0 minecraft:raw_gold run item replace entity @s contents with minecraft:raw_gold_block[custom_model_data={"strings":["gm4_smelteries:block/ore_display/raw_gold"]}]
execute if items block ~ ~ ~ container.0 minecraft:iron_ore run item replace entity @s contents with minecraft:iron_ore[custom_model_data={"strings":["gm4_smelteries:block/ore_display/iron_ore"]}]
execute if items block ~ ~ ~ container.0 minecraft:deepslate_iron_ore run item replace entity @s contents with minecraft:deepslate_iron_ore[custom_model_data={"strings":["gm4_smelteries:block/ore_display/deepslate_iron_ore"]}]
execute if items block ~ ~ ~ container.0 minecraft:raw_iron run item replace entity @s contents with minecraft:raw_iron_block[custom_model_data={"strings":["gm4_smelteries:block/ore_display/raw_iron"]}]
execute if items block ~ ~ ~ container.0 minecraft:copper_ore run item replace entity @s contents with minecraft:copper_ore[custom_model_data={"strings":["gm4_smelteries:block/ore_display/copper_ore"]}]
execute if items block ~ ~ ~ container.0 minecraft:deepslate_copper_ore run item replace entity @s contents with minecraft:deepslate_copper_ore[custom_model_data={"strings":["gm4_smelteries:block/ore_display/deepslate_copper_ore"]}]
execute if items block ~ ~ ~ container.0 minecraft:raw_copper run item replace entity @s contents with minecraft:raw_copper_block[custom_model_data={"strings":["gm4_smelteries:block/ore_display/raw_copper"]}]
execute if items block ~ ~ ~ container.0 minecraft:sand run item replace entity @s contents with minecraft:sand[custom_model_data={"strings":["gm4_smelteries:block/ore_display/sand"]}]
execute if items block ~ ~ ~ container.0 minecraft:red_sand run item replace entity @s contents with minecraft:red_sand[custom_model_data={"strings":["gm4_smelteries:block/ore_display/red_sand"]}]
execute if items block ~ ~ ~ container.0 minecraft:chorus_fruit run item replace entity @s contents with minecraft:chorus_flower[custom_model_data={"strings":["gm4_smelteries:block/ore_display/chorus_fruit"]}]

# check if the furnace is close to finish smelting
execute if score $cook_time gm4_smelt_data matches 184..199 run function gm4_smelteries:smelt/prep_finish_smelt
