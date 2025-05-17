# replaces the player's hand with a new book
# @s = player that triggers gm4_guide
# at @s
# run from gm4_guidebook:tick

# save item count
scoreboard players set $count gm4_guide 0
execute store result score $count gm4_guide run data get entity @s[predicate=gm4_guidebook:book_in_mainhand] SelectedItem.count
execute if score $count gm4_guide matches 0 store result score $count gm4_guide run data get entity @s[predicate=gm4_guidebook:book_in_offhand] equipment.offhand.count

# replace book
## short-circuit if it's the table of contents
$execute if score @s gm4_guide matches 1 run loot replace entity @s[predicate=gm4_guidebook:book_in_mainhand] weapon.mainhand loot {"pools":[{"rolls":1,"entries":[{"type":"minecraft:loot_table","value":"gm4_guidebook:technical/guidebook_with_count","functions":[{"function":"minecraft:set_custom_data","tag":"{gm4_guidebook:{lectern:0b,trigger:1}}"},{"function":"minecraft:set_components","components":{"minecraft:written_book_content":{"pages":$(front_matter),"title":"Gamemode 4 Guidebook","author":"Unknown","generation":3}}}]}]}]}
$execute if score @s gm4_guide matches 1 run loot replace entity @s[predicate=gm4_guidebook:book_in_offhand] weapon.offhand loot {"pools":[{"rolls":1,"entries":[{"type":"minecraft:loot_table","value":"gm4_guidebook:technical/guidebook_with_count","functions":[{"function":"minecraft:set_custom_data","tag":"{gm4_guidebook:{lectern:0b,trigger:1}}"},{"function":"minecraft:set_components","components":{"minecraft:written_book_content":{"pages":$(front_matter),"title":"Gamemode 4 Guidebook","author":"Unknown","generation":3}}}]}]}]}
execute if score @s gm4_guide matches 1 run return 1

## get unlocked pages
execute store result storage gm4_guidebook:temp book.trigger int 1 run scoreboard players get @s gm4_guide
function gm4_guidebook:player_db/get_trigger_name with storage gm4_guidebook:temp book
data modify storage gm4_guidebook:temp book.uuid set from entity @s UUID
function gm4_guidebook:hand/get_pages with storage gm4_guidebook:temp book

## update item
execute store result storage gm4_guidebook:temp book.count int 1 run scoreboard players get $count gm4_guide
function gm4_guidebook:hand/populate with storage gm4_guidebook:temp book
data remove storage gm4_guidebook:temp book
