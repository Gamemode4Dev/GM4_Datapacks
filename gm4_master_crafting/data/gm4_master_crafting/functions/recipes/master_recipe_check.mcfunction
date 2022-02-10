# run from #gm4_master_crafting:recipe_check

# set flag
scoreboard players set successful_master_craft gm4_slot_count 0

# check for liquid recipes
execute if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:4b,id:"minecraft:bucket"}]} run function gm4_master_crafting:recipes/liquid_recipes

# check for brick recipes
execute if score successful_master_craft gm4_slot_count matches 0 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:4b,id:"minecraft:clay_ball"}]} run function gm4_master_crafting:recipes/brick_recipes

# check for block
execute if score successful_master_craft gm4_slot_count matches 0 run function gm4_master_crafting:recipes/block_recipes

# reset fake player
scoreboard players reset successful_master_craft gm4_slot_count
