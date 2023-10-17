# collect data on the looked at book
# @s = player not in spectator mode
# positioned ^ ^ ^-0.05 before chiseled bookshelf
# run from find_book/raycast

# stop the raycast
scoreboard players set $raycast gm4_bookshelf_nametags_data 0

# set evaluate to 1 in case rotation changed but this still ran
scoreboard players set $evaluate gm4_bookshelf_nametags_data 1

# get the slot being looked at
execute summon marker run function gm4_bookshelf_nametags:find_book/get_book_slot

# if evaluation failed stop the function
execute if score $evaluate gm4_bookshelf_nametags_data matches 0 run return 0

# store book data in storage
# NOTE: should this use macro's? It doesn't seem worth it here but not sure how efficient they are
execute if score $book_slot gm4_bookshelf_nametags_data matches 0 run data modify storage gm4_bookshelf_nametags:temp book_data set from block ^ ^ ^0.05 Items[{Slot:0b}]
execute if score $book_slot gm4_bookshelf_nametags_data matches 1 run data modify storage gm4_bookshelf_nametags:temp book_data set from block ^ ^ ^0.05 Items[{Slot:1b}]
execute if score $book_slot gm4_bookshelf_nametags_data matches 2 run data modify storage gm4_bookshelf_nametags:temp book_data set from block ^ ^ ^0.05 Items[{Slot:2b}]
execute if score $book_slot gm4_bookshelf_nametags_data matches 3 run data modify storage gm4_bookshelf_nametags:temp book_data set from block ^ ^ ^0.05 Items[{Slot:3b}]
execute if score $book_slot gm4_bookshelf_nametags_data matches 4 run data modify storage gm4_bookshelf_nametags:temp book_data set from block ^ ^ ^0.05 Items[{Slot:4b}]
execute if score $book_slot gm4_bookshelf_nametags_data matches 5 run data modify storage gm4_bookshelf_nametags:temp book_data set from block ^ ^ ^0.05 Items[{Slot:5b}]

# check if slot actually has a book, otherwise stop the function
# this does not fail evaluation, so there is no delay in case the player is scanning over a half-filled bookshelf
execute unless data storage gm4_bookshelf_nametags:temp book_data run return 0

# find top-left location of this chiseled bookshelf
# 1=north / 2=south / 3=west / 4=east (this is facing direction, so you look against the opposite side of the block)
execute if score $rot gm4_bookshelf_nametags_data matches 1 positioned ^ ^ ^0.05 align xyz positioned ~0.1875 ~0.5625 ~1.001 rotated 0 0 run function gm4_bookshelf_nametags:process_display/locate_slot
execute if score $rot gm4_bookshelf_nametags_data matches 2 positioned ^ ^ ^0.05 align xyz positioned ~0.8125 ~0.5625 ~-0.001 rotated 180 0 run function gm4_bookshelf_nametags:process_display/locate_slot
execute if score $rot gm4_bookshelf_nametags_data matches 3 positioned ^ ^ ^0.05 align xyz positioned ~1.001 ~0.5625 ~0.8125 rotated -90 0 run function gm4_bookshelf_nametags:process_display/locate_slot
execute if score $rot gm4_bookshelf_nametags_data matches 4 positioned ^ ^ ^0.05 align xyz positioned ~-0.001 ~0.5625 ~0.1875 rotated 90 0 run function gm4_bookshelf_nametags:process_display/locate_slot

# cleanup storage
data remove storage gm4_bookshelf_nametags:temp book_data
