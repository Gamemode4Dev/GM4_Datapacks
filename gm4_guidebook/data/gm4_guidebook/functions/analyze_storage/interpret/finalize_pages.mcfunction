# updates each module to have the correct page number
# @s = none
# located at world spawn
# run from gm4_guidebook:analyze_storage/loop_page

# update page numbers (add initial page count)
scoreboard players operation $front_matter gm4_guide = #intro_pages gm4_guide
scoreboard players operation $front_matter gm4_guide += $toc_pages gm4_guide
scoreboard players add $front_matter gm4_guide 3
function gm4_guidebook:analyze_storage/update_page_numbers

# clean up temp storage
data remove storage gm4_guidebook:temp_analyze modules
data remove storage gm4_guidebook:temp modules
data remove storage gm4_guidebook:pre_analyze modules

# build table of contents
data modify storage gm4_guidebook:temp_toc modules set from storage gm4_guidebook:register modules
scoreboard players set $current_page gm4_guide -1
schedule function gm4_guidebook:analyze_storage/table_of_contents/loop_page 1t
