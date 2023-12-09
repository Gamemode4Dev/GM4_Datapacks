# prepares the guide markers
# @s = none
# located at world spawn
# run from gm4_guidebook:init

kill @e[type=marker,tag=gm4_guide]
kill @e[type=marker,tag=gm4_guide_sorter]
function #gm4_guidebook:summon_marker
execute summon marker run function gm4_guidebook:update_storage/alphabetical_sort/setup

schedule function gm4_guidebook:update_storage/build_toc 3t
