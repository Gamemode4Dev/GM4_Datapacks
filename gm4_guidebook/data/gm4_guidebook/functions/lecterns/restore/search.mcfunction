# restores the guidebook to normal form
# @s = player who has moved a lectern book into their inventory
# located at @s
# run from advancement "gm4_guidebook:take_lectern_book"
# run from self

advancement revoke @s only gm4_guidebook:take_lectern_book

# get item data
scoreboard players set $slot gm4_guide -1
data modify storage gm4_guidebook:temp Inventory set from entity @s Inventory
execute store success score $item gm4_guide run data modify storage gm4_guidebook:temp Item set from storage gm4_guidebook:temp Inventory[{tag:{gm4_guidebook:{lectern:1b}}}]
execute if score $item gm4_guide matches 1.. store result score $slot gm4_guide run data get storage gm4_guidebook:temp Item.Slot
execute unless score $slot gm4_guide matches -1 store result score $count gm4_guide run data get storage gm4_guidebook:temp Item.Count

# replace item
execute if score $slot gm4_guide matches 0..8 run function gm4_guidebook:lecterns/restore/hotbar
execute if score $slot gm4_guide matches 9..17 run function gm4_guidebook:lecterns/restore/inv_1
execute if score $slot gm4_guide matches 18..26 run function gm4_guidebook:lecterns/restore/inv_2
execute if score $slot gm4_guide matches 27..35 run function gm4_guidebook:lecterns/restore/inv_3

# clean up
data remove storage gm4_guidebook:temp Item
data remove storage gm4_guidebook:temp Inventory

# loop for all lectern guidebooks
execute unless score $slot gm4_guide matches ..-1 run function gm4_guidebook:lecterns/restore/search
