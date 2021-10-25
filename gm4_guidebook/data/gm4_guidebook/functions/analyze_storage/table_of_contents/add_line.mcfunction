# adds this line to the table of contents storage, utilizing a function tree to get the correct click event
# @s = none
# located at world spawn
# run from gm4_guidebook:analyze_storage/table_of_contents/loop_line

# if it's an expansion, the bullet point is indented
execute if score $expansion gm4_guide matches 0 run data merge storage gm4_guidebook:temp_toc {contents:['{"text":"● ","color":"#4AA0C7"}','{"text":"\\n"}']}
execute if score $expansion gm4_guide matches 1 run data merge storage gm4_guidebook:temp_toc {contents:['{"text":"  ● ","color":"#4AA0C7"}','{"text":"\\n"}']}

# use quaternary search tree to match the click event to the page number
function gm4_guidebook:analyze_storage/table_of_contents/find_page_number/0_749/search

# use sign to interpret the page info
data modify storage gm4_guidebook:temp_toc contents insert 1 from block 29999998 1 7133 Text1
data modify storage gm4_guidebook:temp_toc Page append from storage gm4_guidebook:temp_toc contents[]
data remove storage gm4_guidebook:temp_toc contents
data remove storage gm4_guidebook:temp_toc modules[-1]

# check the next module
function gm4_guidebook:analyze_storage/table_of_contents/loop_line
