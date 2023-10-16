# prep looking for a looked at book
# @s = player not in spectator mode
# at unspecified
# run from evaluate/rotation

scoreboard players set $raycast gm4_bookshelf_reading_data 30
execute anchored eyes positioned ^ ^ ^1 run function gm4_bookshelf_reading:find_book/raycast
