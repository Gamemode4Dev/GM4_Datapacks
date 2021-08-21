# interprets each page of the table of contents
# @s = none
# located at world spawn
# run from gm4_guidebook:analyze_storage/interpret

# prepare page with header
#data modify storage gm4_guidebook:temp Page set value ['{"text":""}','{"translate":"%1$s%3427655$s","with":[{"text":"Table of Contents"},{"translate":"text.gm4.guidebook.table_of_contents"}],"underlined":true}','{"text":"\\n\\n"}']
scoreboard players set $line_count gm4_guide 2

# populate the page with the installed modules
function gm4_guidebook:analyze_storage/loop_line

# add pages until all the modules are listed
scoreboard players add $toc_pages gm4_guide 1
execute if data storage gm4_guidebook:temp_analyze modules[-1] run function gm4_guidebook:analyze_storage/loop_page
