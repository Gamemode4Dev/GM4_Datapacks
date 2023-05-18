# finds expansions matching the base module
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/add_base
# run from self

# check if the expansion matches the base
data modify storage gm4_guidebook:temp expansion set from storage gm4_guidebook:temp check_expansions[0]
scoreboard players set $unmatching gm4_guide 1
execute store success score $unmatching gm4_guide run data modify storage gm4_guidebook:temp expansion.base set from storage gm4_guidebook:temp module.id

# insert expansion into the modules list
execute unless score $unmatching gm4_guide matches 1 run data modify storage gm4_guidebook:temp modules insert -2 from storage gm4_guidebook:temp expansion

# loop for all expansions
data remove storage gm4_guidebook:temp check_expansions[0]
data remove storage gm4_guidebook:temp expansion
scoreboard players remove $expansions gm4_guide 1
execute if score $expansions gm4_guide matches 1.. run function gm4_guidebook:update_storage/find_expansions
