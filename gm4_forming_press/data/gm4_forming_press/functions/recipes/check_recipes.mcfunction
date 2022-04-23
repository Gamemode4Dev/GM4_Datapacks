
# run forming press recipes, all forming press recipes fill all nine slots
execute if score $crafted gm4_crafting matches 0 if score $slot_count gm4_crafting matches 9 run function gm4_forming_press:recipes/forming_check_recipes
