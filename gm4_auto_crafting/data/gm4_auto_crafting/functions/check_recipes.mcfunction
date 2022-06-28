# @s = custom crafters with valid recipe format inside
# run from #gm4_custom_crafters:check_recipes

# recipes
execute if score $crafted gm4_crafting matches 0 run function gm4_auto_crafting:check_recipes/search
