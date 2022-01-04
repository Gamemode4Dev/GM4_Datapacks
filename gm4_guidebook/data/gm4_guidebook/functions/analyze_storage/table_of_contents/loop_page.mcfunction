# interprets each page of the table of contents
# @s = none
# located at world spawn
# run from gm4_guidebook:analyze_storage/interpret/build_table_of_contents

# prepare page with "Table of Contents" header
data modify storage gm4_guidebook:temp_toc Page set value ['{"text":""}','{"translate":"%1$s%3427655$s","with":[{"text":"Table of Contents"},{"translate":"text.gm4.guidebook.table_of_contents"}],"underlined":true}','{"text":"\\n\\n"}']

# populate the page with the installed modules
function gm4_guidebook:analyze_storage/table_of_contents/loop_line
data modify storage gm4_guidebook:front_matter table_of_contents append from storage gm4_guidebook:temp_toc Page
data remove storage gm4_guidebook:temp_toc Page

# add pages until all the modules are listed
scoreboard players add $current_page gm4_guide 1
execute if data storage gm4_guidebook:temp_toc modules[-1] run function gm4_guidebook:analyze_storage/table_of_contents/loop_page
