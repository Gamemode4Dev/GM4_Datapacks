# run evaluation to see if player is not moving
# @s = player not in spectator mode
# at unspecified
# run from main

scoreboard players set $evaluate gm4_bookshelf_nametags_data 1

# check often used transportation methods for movement to skip costly player nbt checks
execute if score @s gm4_bookshelf_nametags_walk matches 1.. run scoreboard players set $evaluate gm4_bookshelf_nametags_data -1
execute if score @s gm4_bookshelf_nametags_sprint matches 1.. run scoreboard players set $evaluate gm4_bookshelf_nametags_data -1

# check if player has motion
execute if score $evaluate gm4_bookshelf_nametags_data matches 1 run function gm4_bookshelf_nametags:evaluate/motion

# if evaluation failed set player standing_still score to 8 if no movement happened, or to 0 if movement happened
execute if score $evaluate gm4_bookshelf_nametags_data matches 0 run scoreboard players set @s[scores={gm4_bookshelf_nametags_standing_still=9..}] gm4_bookshelf_nametags_standing_still 8
execute if score $evaluate gm4_bookshelf_nametags_data matches -1 run scoreboard players reset @s gm4_bookshelf_nametags_standing_still

# cleanup scores
scoreboard players reset @s gm4_bookshelf_nametags_walk
scoreboard players reset @s gm4_bookshelf_nametags_sprint
