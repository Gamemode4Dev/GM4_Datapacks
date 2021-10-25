# adds the base module to the table of contents array, with its expansion packs following
# @s = none
# located at world spawn
# run from gm4_guidebook:analyze_storage/loop_line

# add expansions to go directly under this
data modify storage gm4_guidebook:temp_expansion modules set from storage gm4_guidebook:pre_analyze modules
function gm4_guidebook:analyze_storage/loop_expansions

# clean up
data remove storage gm4_guidebook:temp_expansion modules
