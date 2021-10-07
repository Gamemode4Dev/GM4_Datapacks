execute if score $expansion gm4_guide matches 0 run data merge storage gm4_guidebook:temp_toc {contents:['{"text":"● ","color":"#4AA0C7"}','{"text":"\\n"}']}
execute if score $expansion gm4_guide matches 1 run data merge storage gm4_guidebook:temp_toc {contents:['{"text":"  ● ","color":"#4AA0C7"}','{"text":"\\n"}']}

function gm4_guidebook:table_of_contents/find_page_number/0_1999/search

data modify storage gm4_guidebook:temp_toc contents insert 1 from block 29999998 1 7133 Text1
data modify storage gm4_guidebook:temp_toc Page append from storage gm4_guidebook:temp_toc contents[]
data remove storage gm4_guidebook:temp_toc contents
data remove storage gm4_guidebook:temp_toc modules[-1]

function gm4_guidebook:table_of_contents/loop_line
