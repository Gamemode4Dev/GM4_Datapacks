# raycast for a chiseled bookshelf
# @s = player not in spectator mode
# at @s anchored eyes, positioned ^ ^ ^1 + 0.05x (x = 0..50)
# run from find_book/prep
# run from here

scoreboard players remove $raycast gm4_bookshelf_inspector_data 1

# check for bookshelf slightly up ahead
execute if block ^ ^ ^0.0501 chiseled_bookshelf run function gm4_bookshelf_inspector:find_book/find_book

# if a block is hit stop the raycast
execute unless block ~ ~ ~ #gm4:no_collision run scoreboard players set $raycast gm4_bookshelf_inspector_data 0

execute if score $raycast gm4_bookshelf_inspector_data matches 1.. positioned ^ ^ ^0.05 run function gm4_bookshelf_inspector:find_book/raycast
