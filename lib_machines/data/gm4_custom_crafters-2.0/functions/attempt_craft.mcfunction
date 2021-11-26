# attempts to craft items
# @s = crafters containing a potential recipe
# located at @s
# run from gm4_custom_crafters-2.0:recipe_validity_check

# allow crafters with valid contents to run recipe checks
function #gm4_custom_crafters:recipe_check

# check if one of the recipes succeeded
execute if data block ~ ~ ~ Items[-1].tag.gm4_custom_crafters run function gm4_custom_crafters-2.0:finish_crafting
