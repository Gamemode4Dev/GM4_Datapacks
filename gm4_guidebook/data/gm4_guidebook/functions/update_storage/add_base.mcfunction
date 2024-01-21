# adds the base module to the table of contents array, with its expansion packs following
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/build_line

# add expansions to go directly under this
data modify storage gm4_guidebook:temp check_expansions set from storage gm4_guidebook:temp expansions
scoreboard players operation $expansions gm4_guide = $expansion_count gm4_guide
function gm4_guidebook:update_storage/find_expansions

# clean up
data remove storage gm4_guidebook:temp check_expansions
