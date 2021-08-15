# interprets each page of the table of contents
# @s = none
# located at world spawn
# run from gm4_guidebook:table_of_contents/interpret

# prepare page with header
data modify storage gm4_guidebook:temp Page set value ['{"text":""}','{"translate":"%1$s%3427655$s","with":[{"text":"Table of Contents"},{"translate":"text.gm4.guidebook.table_of_contents"}],"underlined":true}','{"text":"\\n\\n"}']
scoreboard players set $line_count gm4_guide 2

# populate the page with the installed modules
function gm4_guidebook:table_of_contents/loop_line
data modify storage gm4_guidebook:register table_of_contents append from storage gm4_guidebook:temp Page
data remove storage gm4_guidebook:temp Page

# add pages until all the modules are listed
scoreboard players add $toc_pages gm4_guide 1
execute if data storage gm4_guidebook:temp modules[-1] run function gm4_guidebook:table_of_contents/loop_page
