# adds the module to the table of contents array
# @s = none
# located at world spawn
# run from gm4_guidebook:table_of_contents/loop_line

# add the number of pages this module will add to the total page count
execute store result score $add_page gm4_guide run data get storage gm4_guidebook:temp module.page_count
execute store result storage gm4_guidebook:temp module.page_number int 1 run scoreboard players get $page_count gm4_guide
scoreboard players operation $page_count gm4_guide += $add_page gm4_guide
scoreboard players add $page_count gm4_guide 1

# set the table of contents page for this module
execute store result storage gm4_guidebook:temp module.toc_page int 1 run scoreboard players get $initial_pages gm4_guide

# add the module to the table of contents
data modify storage gm4_guidebook:temp table_of_contents append from storage gm4_guidebook:temp module
scoreboard players add $module_count gm4_guide 1

# store the line count for this page
execute store result score $add_line gm4_guide run data get storage gm4_guidebook:temp module.line_count
scoreboard players operation $line_count gm4_guide += $add_line gm4_guide
