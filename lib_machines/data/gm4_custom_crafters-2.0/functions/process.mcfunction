# processes custom crafters
# @s = custom crafter marker
# located at @s
# run from gm4_custom_crafters-2.0:main

# recipes
execute if block ~ ~ ~ dropper[triggered=false]{Items:[{}]} run function gm4_custom_crafters-2.0:recipe_validity_check
