# updates the starting page number of each module
# @s = none
# located at world spawn
# run from gm4_guidebook:analyze_storage/interpret

# add initial page count (intro + table of contents) to the page number
execute store result score $page_number gm4_guide run data get storage gm4_guidebook:temp modules[-1].page_number
scoreboard players operation $page_number gm4_guide += $front_matter gm4_guide
execute store result storage gm4_guidebook:temp modules[-1].page_number int 1 run scoreboard players get $page_number gm4_guide

# put into permanent storage
data modify storage gm4_guidebook:register modules append from storage gm4_guidebook:temp modules[-1]

# loop for all modules
data remove storage gm4_guidebook:temp modules[-1]
execute if data storage gm4_guidebook:temp modules[-1] run function gm4_guidebook:analyze_storage/update_page_numbers
