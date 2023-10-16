# run evaluation to see if player is not moving
# @s = player not in spectator mode
# at unspecified
# run from main

scoreboard players set $evaluate gm4_bookshelf_reading_data 1

# check often used transportation methods for movement to skip costly player nbt checks
execute if score @s gm4_bookshelf_reading_walk matches 1.. run scoreboard players set $evaluate gm4_bookshelf_reading_data 0
execute if score @s gm4_bookshelf_reading_sprint matches 1.. run scoreboard players set $evaluate gm4_bookshelf_reading_data 0

# check if player has motion
execute if score $evaluate gm4_bookshelf_reading_data matches 1 run function gm4_bookshelf_reading:evaluate/motion

# if evaluation failed reset player standing_still score
execute if score $evaluate gm4_bookshelf_reading_data matches 0 run scoreboard players reset @s gm4_bookshelf_reading_standing_still
