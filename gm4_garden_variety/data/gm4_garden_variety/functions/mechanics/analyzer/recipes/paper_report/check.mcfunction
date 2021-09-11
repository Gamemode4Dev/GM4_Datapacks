# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/update

# reset recipe check
scoreboard players set $recipe_check gm4_gv_analyzer 1

# check for conditions
execute unless data storage gm4_garden_variety:analyzer Items[{Slot:1b}].tag.gm4_garden_variety run scoreboard players set $recipe_check gm4_gv_analyzer 0
execute if data storage gm4_garden_variety:analyzer Items[{Slot:2b}] run scoreboard players set $recipe_check gm4_gv_analyzer 0

# complete
execute if score $recipe_check gm4_gv_analyzer matches 1 run function gm4_garden_variety:mechanics/analyzer/recipes/paper_report/analyzing
