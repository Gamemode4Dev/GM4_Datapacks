# checks for auto crafters that need to update recipe shapes
# @s = none
# located at world spawn
# run from gm4_auto_crafting:auto_crafter/caching/open_auto_crafter

# update recipe shapes when the player leaves
execute as @e[type=marker,tag=gm4_ac_updating] at @s run function gm4_auto_crafting:auto_crafter/caching/update

# loop until there are no more updating auto crafters
execute if entity @e[type=marker,tag=gm4_ac_updating,limit=1] run schedule function gm4_auto_crafting:auto_crafter/caching/temp_clock 16t
