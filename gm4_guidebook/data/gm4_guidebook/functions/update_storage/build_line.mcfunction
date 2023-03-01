# builds each line of each page of the table of contents
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/build_page

# set next line based on installed modules
data modify storage gm4_guidebook:temp module set from storage gm4_guidebook:temp modules[-1]
execute if data storage gm4_guidebook:temp module{type:"base"} run function gm4_guidebook:update_storage/add_base
execute store result score $trigger gm4_guide run data get storage gm4_guidebook:temp module.trigger
function #gm4_guidebook:add_toc_line

# loop until this page is full or there's no more modules
data remove storage gm4_guidebook:temp modules[-1]
data remove storage gm4_guidebook:temp module
scoreboard players remove $module_count gm4_guide 1
execute unless score $line_count gm4_guide matches 13.. if score $module_count gm4_guide matches 1.. run function gm4_guidebook:update_storage/build_line
