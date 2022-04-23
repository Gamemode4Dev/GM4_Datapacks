# run from #gm4_forming_press:check_recipes

# check for liquid recipes
execute if score $crafted gm4_crafting matches 0 if data storage gm4_forming_press:temp/crafter {Items:[{Slot:4b,id:"minecraft:bucket"}]} run function gm4_forming_press:recipes/liquid_recipes

# check for brick recipes
execute if score $crafted gm4_crafting matches 0 if data storage gm4_forming_press:temp/crafter {Items:[{Slot:4b,id:"minecraft:clay_ball"}]} run function gm4_forming_press:recipes/brick_recipes

# check for block
execute if score $crafted gm4_crafting matches 0 run function gm4_forming_press:recipes/block_recipes
