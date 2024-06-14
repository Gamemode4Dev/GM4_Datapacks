# processes custom crafters
# @s = gm4_custom_crafter unless block ~ ~ ~ dropper{Items:[]}
# located at @s
# run from gm4_custom_crafters:main

# store all block data into storage
data modify storage gm4_custom_crafters:temp/crafter Items set from block ~ ~ ~ Items

# check if the crafter should run recipe checks
execute if entity @s[tag=gm4_custom_crafters_crafted] run function gm4_custom_crafters:process_input/check_cache
execute unless entity @s[tag=gm4_custom_crafters_crafted] run function gm4_custom_crafters:process_input/recipe_validity_check

# clean up
data remove storage gm4_custom_crafters:temp/crafter Items
