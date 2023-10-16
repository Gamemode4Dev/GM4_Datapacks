# check player motion
# @s = player not in spectator mode
# at unspecified
# run from evaluate/run

# store player motion, then try to overwrite with 0 motion
# if successful player was moving and evaluation can stop
data modify storage gm4_bookshelf_reading:temp Motion set from entity @s Motion
execute store success score $has_motion gm4_bookshelf_reading_data run data modify storage gm4_bookshelf_reading:temp Motion set value [0.0f,0.0f,0.0f]
execute if score $has_motion gm4_bookshelf_reading_data matches 1 run scoreboard players set $evaluate gm4_bookshelf_reading_data 0

# if player had no motion check rotation
execute if score $evaluate gm4_bookshelf_reading_data matches 1 run function gm4_bookshelf_reading:evaluate/rotation
