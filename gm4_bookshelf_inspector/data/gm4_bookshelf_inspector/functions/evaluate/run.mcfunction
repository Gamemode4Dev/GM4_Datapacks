# check if the player is looking at a chiseled bookshelf
# @s = player not in spectator mode and not moving
# at unspecified
# run from main

# look for chiseled bookshelf
scoreboard players set $simple_raycast gm4_bookshelf_inspector_data 11
execute at @s anchored eyes positioned ^ ^ ^1 run function gm4_bookshelf_inspector:evaluate/raycast
