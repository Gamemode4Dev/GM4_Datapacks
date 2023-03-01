# replaces the player's hand with a new book
# @s = player that triggers gm4_guide
# at @s
# run from gm4_guidebook:tick via #gm4_guidebook:update_hand

# save item count
scoreboard players set $count gm4_guide 0
execute store result score $count gm4_guide run data get entity @s[predicate=gm4_guidebook:book_in_mainhand] SelectedItem.Count
execute if score $count gm4_guide matches 0 store result score $count gm4_guide run data get entity @s[predicate=gm4_guidebook:book_in_offhand] Inventory[{Slot:-106b}].Count

# replace book
execute if score @s gm4_guide matches 1 run loot replace entity @s[predicate=gm4_guidebook:book_in_mainhand] weapon.mainhand loot gm4_guidebook:_guidebook
execute if score @s gm4_guide matches 1 run loot replace entity @s[predicate=gm4_guidebook:book_in_offhand] weapon.offhand loot gm4_guidebook:_guidebook
function #gm4_guidebook:update_hand
data remove storage gm4_guidebook:temp pages

# restore item count
item modify entity @s[predicate=gm4_guidebook:book_in_mainhand] weapon.mainhand gm4_guidebook:restore_count
item modify entity @s[predicate=gm4_guidebook:book_in_offhand] weapon.offhand gm4_guidebook:restore_count
