

loot replace entity @s[predicate=gm4_guidebook:book_in_mainhand] weapon.mainhand loot gm4_guidebook:items/guidebook
loot replace entity @s[predicate=gm4_guidebook:book_in_offhand] weapon.mainhand loot gm4_guidebook:items/guidebook

# insert table of contents
data modify storage gm4_guidebook:temp insert_pages set from storage gm4_guidebook:front_matter pages

# 
data modify storage gm4_guidebook:temp modules set from storage gm4_guidebook:register modules
function gm4_guidebook:update_book/loop_modules

item modify entity @s[predicate=gm4_guidebook:book_in_mainhand] weapon.mainhand gm4_guidebook:add_pages
item modify entity @s[predicate=gm4_guidebook:book_in_offhand] weapon.offhand gm4_guidebook:add_pages

data remove storage gm4_guidebook:temp modules
data remove storage gm4_guidebook:temp insert_pages
