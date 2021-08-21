# interprets the table of contents based on the installed modules
# @s = none
# located at world spawn
# run from gm4_guidebook:init

# prepare iteration of storage
scoreboard players set $page_count gm4_guide 0
scoreboard players set $toc_pages gm4_guide 0
data modify storage gm4_guidebook:temp_analyze modules set from storage gm4_guidebook:pre_analyze modules
data merge storage gm4_guidebook:register {modules:[]}

# set the pages of the table of contents
function gm4_guidebook:analyze_storage/loop_page

# update page numbers (add initial page count)
scoreboard players operation $front_matter gm4_guide = #intro_pages gm4_guide
scoreboard players operation $front_matter gm4_guide += $toc_pages gm4_guide
scoreboard players add $front_matter gm4_guide 2
function gm4_guidebook:analyze_storage/update_page_numbers

# clean up
data remove storage gm4_guidebook:temp_analyze modules
data remove storage gm4_guidebook:temp modules
data remove storage gm4_guidebook:pre_analyze modules

# build table of contents
data modify storage gm4_guidebook:temp_toc modules set from storage gm4_guidebook:register modules
scoreboard players set $current_page gm4_guide 0
function gm4_guidebook:table_of_contents/loop_page
function gm4_guidebook:table_of_contents/interpret_pages
data remove storage gm4_guidebook:temp_toc modules
