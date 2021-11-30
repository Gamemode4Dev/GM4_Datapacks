# @s = custom crafter running recipes
# run from #gm4_custom_crafters:recipe_check

execute if score $slot_count gm4_crafting matches 3 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:1b,id:"minecraft:ender_eye"},{Slot:4b,id:"minecraft:respawn_anchor"},{Slot:7b,id:"minecraft:hopper"}]} run loot replace block ~ ~ ~ container.0 loot gm4_ender_hoppers:crafting/ender_hopper
