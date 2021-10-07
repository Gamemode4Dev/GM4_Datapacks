# updates the starting page number of each module
# @s = none
# located at world spawn
# run from gm4_guidebook:table_of_contents/interpret

# add initial page count (intro + table of contents) to the page number
execute store result score $page_number gm4_guide run data get storage gm4_guidebook:temp table_of_contents[-1].page_number
scoreboard players operation $page_number gm4_guide += $initial_pages gm4_guide
execute store result storage gm4_guidebook:temp table_of_contents[-1].page_number int 1 run scoreboard players get $page_number gm4_guide

# put into permanent storage
data modify storage gm4_guidebook:register table_of_contents prepend from storage gm4_guidebook:temp table_of_contents[-1]

# loop for all modules
data remove storage gm4_guidebook:temp table_of_contents[-1]
execute if data storage gm4_guidebook:temp table_of_contents[-1] run function gm4_guidebook:table_of_contents/update_page_numbers
