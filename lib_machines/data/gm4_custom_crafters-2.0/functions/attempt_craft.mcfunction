# attempts to craft items
# @s = crafters containing a potential recipe
# located at @s
# run from gm4_custom_crafters-2.0:recipe_validity_check

# allow crafters with valid contents to run recipe checks
scoreboard players set $crafted gm4_crafting 0
function #gm4_custom_crafters:check_recipes

# check if one of the recipes succeeded
execute unless score $crafted gm4_crafting matches 0 run function gm4_custom_crafters-2.0:finish_crafting
