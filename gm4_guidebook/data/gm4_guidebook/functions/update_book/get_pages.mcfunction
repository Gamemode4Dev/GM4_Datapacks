# updates the player's guidebook
# @s = player that triggered gm4_guide while holding a guidebook
# located at world spawn
# run from gm4_guidebook:tick

# get number of books the player is holding
execute if predicate gm4_guidebook:book_in_mainhand store result score $count gm4_guide run data get entity @s SelectedItem.Count
execute if predicate gm4_guidebook:book_in_offhand store result score $count gm4_guide run data get entity @s Inventory[{Slot:-106b}].Count

# reset the player's book
loot replace entity @s[predicate=gm4_guidebook:book_in_mainhand] weapon.mainhand loot gm4_guidebook:items/guidebook
loot replace entity @s[predicate=gm4_guidebook:book_in_offhand] weapon.offhand loot gm4_guidebook:items/guidebook

# insert table of contents to storage
data modify storage gm4_guidebook:temp insert_pages set from storage gm4_guidebook:front_matter pages

# allow modules to add pages to storage
data modify storage gm4_guidebook:temp modules set from storage gm4_guidebook:register modules
function gm4_guidebook:update_book/loop_modules

# replace book of player
item modify entity @s[predicate=gm4_guidebook:book_in_mainhand] weapon.mainhand gm4_guidebook:add_pages
item modify entity @s[predicate=gm4_guidebook:book_in_offhand] weapon.offhand gm4_guidebook:add_pages

# clean up
data remove storage gm4_guidebook:temp modules
data remove storage gm4_guidebook:temp insert_pages
