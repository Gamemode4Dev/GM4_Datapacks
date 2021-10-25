# creates the table of contents storage
# @s = none
# located at world spawn
# run from gm4_guidebook:analyze_storage/interpret/schedule

# clean up temp storage
data remove storage gm4_guidebook:temp_analyze modules
data remove storage gm4_guidebook:temp modules
data remove storage gm4_guidebook:pre_analyze modules

# build table of contents
data modify storage gm4_guidebook:temp_toc modules set from storage gm4_guidebook:register modules
scoreboard players set $current_page gm4_guide 0
function gm4_guidebook:analyze_storage/table_of_contents/loop_page
