# adds the module to the table of contents array
# @s = none
# located at world spawn
# run from gm4_guidebook:analyze_storage/loop_line

# add the number of pages this module will add to the total page count
execute store result score $add_page gm4_guide run data get storage gm4_guidebook:temp_analyze module.page_count
execute store result storage gm4_guidebook:temp_analyze module.page_number int 1 run scoreboard players get $page_count gm4_guide
scoreboard players operation $page_count gm4_guide += $add_page gm4_guide
execute unless data storage gm4_guidebook:temp_analyze module{type:"expansion"} run scoreboard players add $page_count gm4_guide 1

# set the table of contents page for this module
execute store result storage gm4_guidebook:temp_analyze module.toc_page int 1 run scoreboard players get $toc_pages gm4_guide

# add the module to the table of contents
data modify storage gm4_guidebook:temp modules append from storage gm4_guidebook:temp_analyze module
scoreboard players add $module_count gm4_guide 1

# add the line count to this page
execute store result score $add_line gm4_guide run data get storage gm4_guidebook:temp_analyze module.line_count
scoreboard players operation $line_count gm4_guide += $add_line gm4_guide
