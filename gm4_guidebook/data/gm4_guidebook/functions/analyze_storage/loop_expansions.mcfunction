# finds expansions matching the base module
# @s = none
# located at world spawn
# run from gm4_guidebook:analyze_storage/add_base

# check if the expansion matches the base
data modify storage gm4_guidebook:temp_expansion module set from storage gm4_guidebook:temp_expansion modules[0]
scoreboard players set $unmatching gm4_guide 1
execute if data storage gm4_guidebook:temp_expansion module{type:"_expansion"} store success score $unmatching gm4_guide run data modify storage gm4_guidebook:temp_expansion module.base set from storage gm4_guidebook:temp_analyze module.id

# add expansion to the modules list
execute unless score $unmatching gm4_guide matches 1 run function gm4_guidebook:analyze_storage/add_expansion

# loop until this page is full or there's no more modules
data remove storage gm4_guidebook:temp_expansion modules[0]
data remove storage gm4_guidebook:temp_expansion module
execute if data storage gm4_guidebook:temp_expansion modules[0] run function gm4_guidebook:analyze_storage/loop_expansions
