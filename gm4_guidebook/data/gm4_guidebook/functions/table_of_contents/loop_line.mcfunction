# interprets each line of the page
# @s = none
# located at world spawn
# run from gm4_guidebook:table_of_contents/loop_page

# set next line based on installed modules
data modify storage gm4_guidebook:temp Page append from storage gm4_guidebook:temp modules[-1].line[]
data modify storage gm4_guidebook:temp Page append value "{\"text\":\"\\n\"}"
data remove storage gm4_guidebook:temp modules[-1]
scoreboard players add $module_count gm4_guide 1

# add lines until it reaches the end of the page
execute store result score $add_line gm4_guide run data get storage gm4_guidebook:temp modules[-1].line_count
scoreboard players operation $line_count gm4_guide += $add_line gm4_guide
execute unless score $line_count gm4_guide matches 12.. if data storage gm4_guidebook:temp modules[-1] run function gm4_guidebook:table_of_contents/loop_line
