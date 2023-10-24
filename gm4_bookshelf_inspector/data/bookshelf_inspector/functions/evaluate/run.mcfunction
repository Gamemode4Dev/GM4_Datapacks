# run evaluation to see if player is not moving
# @s = player not in spectator mode
# at unspecified
# run from main

scoreboard players set $evaluate gm4_bookshelf_inspector_data 1

# check often used transportation methods for movement to skip costly nbt checks
execute if score @s gm4_bookshelf_inspector_walk matches 1.. run scoreboard players set $evaluate gm4_bookshelf_inspector_data -1
execute if score @s gm4_bookshelf_inspector_sprint matches 1.. run scoreboard players set $evaluate gm4_bookshelf_inspector_data -1
execute if score @s gm4_bookshelf_inspector_dall matches 1.. run scoreboard players set $evaluate gm4_bookshelf_inspector_data -1

# check if player has motion
execute if score $evaluate gm4_bookshelf_inspector_data matches 1 run function gm4_bookshelf_inspector:evaluate/motion

# if evaluation failed set player standing_still score to 8 if no movement happened, or to 0 if movement happened
execute if score $evaluate gm4_bookshelf_inspector_data matches 0 run scoreboard players set @s[scores={gm4_bookshelf_inspector_standing_still=9..}] gm4_bookshelf_inspector_standing_still 8
execute if score $evaluate gm4_bookshelf_inspector_data matches -1 run scoreboard players reset @s gm4_bookshelf_inspector_standing_still

# cleanup scores
scoreboard players reset @s gm4_bookshelf_inspector_walk
scoreboard players reset @s gm4_bookshelf_inspector_sprint
scoreboard players reset @s gm4_bookshelf_inspector_fall
