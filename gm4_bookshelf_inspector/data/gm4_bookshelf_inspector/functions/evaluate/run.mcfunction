# check player motion and if they are looking at a chiseled bookshelf
# @s = player not in spectator mode
# at unspecified
# run from main

# do not check for chiseled bookshelves if the player moved anyway, allow some leniency for walking to avoid nudging removing the display 
execute if score @s gm4_bookshelf_inspector_walk matches 100.. run return 0
execute if score @s gm4_bookshelf_inspector_sprint matches 1.. run return 0
execute if score @s gm4_bookshelf_inspector_fall matches 1.. run return 0

# look for chiseled bookshelf
scoreboard players set $simple_raycast gm4_bookshelf_inspector_data 11
execute at @s anchored eyes positioned ^ ^ ^1 run function gm4_bookshelf_inspector:evaluate/raycast
