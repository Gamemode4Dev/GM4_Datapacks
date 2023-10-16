# collect data on the looked at book
# @s = player not in spectator mode
# at chiseled bookshelf
# run from find_book/raycast

# get the slot being looked at
execute summon marker run function gm4_bookshelf_reading:find_book/get_book_slot

# store book data in storage
# NOTE: should this use macro's? It doesn't seem worth it here but not sure how efficient they are
execute if score $book_slot gm4_bookshelf_reading_data matches 0 run data modify storage gm4_bookshelf_reading:temp book_data set from block ~ ~ ~ Items[{Slot:0b}]
execute if score $book_slot gm4_bookshelf_reading_data matches 1 run data modify storage gm4_bookshelf_reading:temp book_data set from block ~ ~ ~ Items[{Slot:1b}]
execute if score $book_slot gm4_bookshelf_reading_data matches 2 run data modify storage gm4_bookshelf_reading:temp book_data set from block ~ ~ ~ Items[{Slot:2b}]
execute if score $book_slot gm4_bookshelf_reading_data matches 3 run data modify storage gm4_bookshelf_reading:temp book_data set from block ~ ~ ~ Items[{Slot:3b}]
execute if score $book_slot gm4_bookshelf_reading_data matches 4 run data modify storage gm4_bookshelf_reading:temp book_data set from block ~ ~ ~ Items[{Slot:4b}]
execute if score $book_slot gm4_bookshelf_reading_data matches 5 run data modify storage gm4_bookshelf_reading:temp book_data set from block ~ ~ ~ Items[{Slot:5b}]

# find top-left location of this chiseled bookshelf
# 1=north / 2=south / 3=east / 4=west (this is facing direction, so you look against the opposite side of the block)
execute if score $rot gm4_bookshelf_reading_data matches 1 align xyz positioned ~0.165 ~0.66 ~1.05 rotated 0 0 run function gm4_bookshelf_reading:process_display/locate_slot
execute if score $rot gm4_bookshelf_reading_data matches 2 align xyz positioned ~0.165 ~0.66 ~-0.05 rotated 180 0 run function gm4_bookshelf_reading:process_display/locate_slot
execute if score $rot gm4_bookshelf_reading_data matches 3 align xyz positioned ~1.05 ~0.66 ~0.165 rotated 90 0 run function gm4_bookshelf_reading:process_display/locate_slot
execute if score $rot gm4_bookshelf_reading_data matches 4 align xyz positioned ~-0.05 ~0.66 ~0.165 rotated -90 0 run function gm4_bookshelf_reading:process_display/locate_slot
