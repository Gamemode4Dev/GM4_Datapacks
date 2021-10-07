# populates the table of contents
# @s = player who used the trigger with the book in their offhand
# located at world spawn
# run from gm4_guidebook:trigger/offhand

data modify storage gm4_guidebook:temp Page set value '[{"nbt":"table_of_contents[0][]","storage":"gm4_guidebook:register","interpret":true,"separator":""}]'
item modify entity @s weapon.offhand gm4_guidebook:add_page
execute if score $toc_pages gm4_guide matches 2.. run data modify storage gm4_guidebook:temp Page set value '[{"nbt":"table_of_contents[1][]","storage":"gm4_guidebook:register","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 2.. run item modify entity @s weapon.offhand gm4_guidebook:add_page
execute if score $toc_pages gm4_guide matches 3.. run data modify storage gm4_guidebook:temp Page set value '[{"nbt":"table_of_contents[2][]","storage":"gm4_guidebook:register","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 3.. run item modify entity @s weapon.offhand gm4_guidebook:add_page
execute if score $toc_pages gm4_guide matches 4.. run data modify storage gm4_guidebook:temp Page set value '[{"nbt":"table_of_contents[3][]","storage":"gm4_guidebook:register","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 4.. run item modify entity @s weapon.offhand gm4_guidebook:add_page
execute if score $toc_pages gm4_guide matches 5.. run data modify storage gm4_guidebook:temp Page set value '[{"nbt":"table_of_contents[4][]","storage":"gm4_guidebook:register","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 5.. run item modify entity @s weapon.offhand gm4_guidebook:add_page
execute if score $toc_pages gm4_guide matches 6.. run data modify storage gm4_guidebook:temp Page set value '[{"nbt":"table_of_contents[5][]","storage":"gm4_guidebook:register","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 6.. run item modify entity @s weapon.offhand gm4_guidebook:add_page
execute if score $toc_pages gm4_guide matches 7.. run data modify storage gm4_guidebook:temp Page set value '[{"nbt":"table_of_contents[6][]","storage":"gm4_guidebook:register","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 7.. run item modify entity @s weapon.offhand gm4_guidebook:add_page
execute if score $toc_pages gm4_guide matches 8.. run data modify storage gm4_guidebook:temp Page set value '[{"nbt":"table_of_contents[7][]","storage":"gm4_guidebook:register","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 8.. run item modify entity @s weapon.offhand gm4_guidebook:add_page
execute if score $toc_pages gm4_guide matches 9.. run data modify storage gm4_guidebook:temp Page set value '[{"nbt":"table_of_contents[8][]","storage":"gm4_guidebook:register","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 9.. run item modify entity @s weapon.offhand gm4_guidebook:add_page
execute if score $toc_pages gm4_guide matches 10.. run data modify storage gm4_guidebook:temp Page set value '[{"nbt":"table_of_contents[9][]","storage":"gm4_guidebook:register","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 10.. run item modify entity @s weapon.offhand gm4_guidebook:add_page
