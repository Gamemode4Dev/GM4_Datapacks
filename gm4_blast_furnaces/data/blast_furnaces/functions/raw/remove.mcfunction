# Called from check_recipes.mcfunction
# @s = valid smeltery without a recipe

# OR

# Called from update.mcfunction
# @s = broken smeltery with ore tag



function #blast_furnaces:clear_recipe
tag @s remove gm4_bf_has_raw

data merge entity @s {ArmorItems:[{},{},{},{}]}
