# prep looking for a looked at book
# @s = player not in spectator mode
# at unspecified
# run from evaluate/rotation

scoreboard players set $raycast gm4_bookshelf_nametags_data 50
execute at @s anchored eyes positioned ^ ^ ^1 run function gm4_bookshelf_nametags:find_book/raycast