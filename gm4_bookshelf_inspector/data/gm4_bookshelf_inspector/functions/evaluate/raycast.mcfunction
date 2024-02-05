# raycast for a chiseled bookshelf
# @s = player not in spectator mode
# at @s anchored eyes, positioned ^ ^ ^1 + 0.25x (x = 0..11)
# run from evaluate/run
# run from here

scoreboard players remove $simple_raycast gm4_bookshelf_inspector_data 1

# check for chiseled bookshelves
execute if block ~ ~ ~ chiseled_bookshelf run function gm4_bookshelf_inspector:find_book/prep

# stop raycast when block is hit (including chiseled bookshelf)
execute unless block ~ ~ ~ #gm4:no_collision run scoreboard players set $simple_raycast gm4_bookshelf_inspector_data 0

execute if score $simple_raycast gm4_bookshelf_inspector_data matches 1.. positioned ^ ^ ^0.25 run function gm4_bookshelf_inspector:evaluate/raycast
