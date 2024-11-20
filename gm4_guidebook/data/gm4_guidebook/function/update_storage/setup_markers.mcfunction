# prepares the guide markers
# @s = none
# located at world spawn
# run from gm4_guidebook:init

# summon markers
kill @e[type=marker,tag=gm4_guide]
function #gm4_guidebook:summon_marker

# sort all tags
schedule function gm4_guidebook:update_storage/build_toc 1t
