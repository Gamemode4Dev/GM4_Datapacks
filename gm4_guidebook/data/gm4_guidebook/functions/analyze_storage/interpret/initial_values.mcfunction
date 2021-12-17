# adds each module to the table of contents
# @s = none
# located at world spawn
# run from gm4_guidebook:init

# prepare iteration of storage
scoreboard players set $page_count gm4_guide 0
scoreboard players set $toc_pages gm4_guide -1
data modify storage gm4_guidebook:temp_analyze modules set from storage gm4_guidebook:pre_analyze modules
data merge storage gm4_guidebook:register {modules:[]}

# set the pages of the table of contents
schedule function gm4_guidebook:analyze_storage/loop_page 1t
