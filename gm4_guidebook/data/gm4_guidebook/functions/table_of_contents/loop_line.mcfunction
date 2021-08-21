data modify storage gm4_guidebook:temp_toc module set from storage gm4_guidebook:temp_toc modules[-1]
execute store result score $page gm4_guide run data get storage gm4_guidebook:temp_toc module.page_number
execute store success score $expansion gm4_guide if data storage gm4_guidebook:temp_toc module{type:"expansion"}
execute store result score $toc_page gm4_guide run data get storage gm4_guidebook:temp_toc module.toc_page
data remove storage gm4_guidebook:temp_toc module

execute if score $toc_page gm4_guide = $current_page gm4_guide run function gm4_guidebook:table_of_contents/add_line

