# raycast for a chiseled bookshelf
# @s = player not in spectator mode
# at @s anchored eyes, positioned ^ ^ ^1 + 0.05x (x = 0..30)
# run from find_book/prep
# run from here

scoreboard players remove $raycast gm4_bookshelf_reading_data 1

# check for bookshelf slightly up ahead
execute if block ^ ^ ^0.025 chiseled_bookshelf positioned ^ ^ ^0025 run function gm4_bookshelf_reading:find_book/find_book

execute if score $raycast gm4_bookshelf_reading_data matches 1.. positioned ^ ^ ^0.05 run function gm4_bookshelf_reading:find_book/raycast
