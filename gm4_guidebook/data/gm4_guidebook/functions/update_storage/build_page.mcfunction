# builds each page of the table of contents
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/build_toc

# build lines
scoreboard players set $line_count gm4_guide 2
data merge storage gm4_guidebook:temp {page:[]}
function gm4_guidebook:update_storage/build_line

# loop for all modules
scoreboard players add $toc_pages gm4_guide 1
data modify storage gm4_guidebook:register table_of_contents append from storage gm4_guidebook:temp page
execute if score $module_count gm4_guide matches 1.. run function gm4_guidebook:update_storage/build_page
