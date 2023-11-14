# check player motion
# @s = player not in spectator mode
# at unspecified
# run from evaluate/run

# store player position and rotation using a marker to avoid reading player NBT
tag @s add gm4_bookshelf_inspector_target
execute summon marker run function gm4_bookshelf_inspector:evaluate/get_pos
tag @s remove gm4_bookshelf_inspector_target

# calculate how far player has moved since last check
# first, get the players current position from storage
execute store result score $pos_x gm4_bookshelf_inspector_data run data get storage gm4_bookshelf_inspector:temp Pos[0] 1000
execute store result score $pos_y gm4_bookshelf_inspector_data run data get storage gm4_bookshelf_inspector:temp Pos[1] 1000
execute store result score $pos_z gm4_bookshelf_inspector_data run data get storage gm4_bookshelf_inspector:temp Pos[2] 1000
# store the distance between that and the position last tick in a float value
scoreboard players operation $distance_x gm4_bookshelf_inspector_data = $pos_x gm4_bookshelf_inspector_data
scoreboard players operation $distance_y gm4_bookshelf_inspector_data = $pos_y gm4_bookshelf_inspector_data
scoreboard players operation $distance_z gm4_bookshelf_inspector_data = $pos_z gm4_bookshelf_inspector_data
execute store result storage gm4_bookshelf_inspector:temp distance_calc.x float 0.001 run scoreboard players operation $distance_x gm4_bookshelf_inspector_data -= @s gm4_bookshelf_inspector_last_pos_x
execute store result storage gm4_bookshelf_inspector:temp distance_calc.y float 0.001 run scoreboard players operation $distance_y gm4_bookshelf_inspector_data -= @s gm4_bookshelf_inspector_last_pos_y
execute store result storage gm4_bookshelf_inspector:temp distance_calc.z float 0.001 run scoreboard players operation $distance_z gm4_bookshelf_inspector_data -= @s gm4_bookshelf_inspector_last_pos_z
# use item_display transformation to calculate the distance
execute summon item_display run function gm4_bookshelf_inspector:evaluate/calc_distance with storage gm4_bookshelf_inspector:temp distance_calc
# store the current position for the next tick
scoreboard players operation @s gm4_bookshelf_inspector_last_pos_x = $pos_x gm4_bookshelf_inspector_data
scoreboard players operation @s gm4_bookshelf_inspector_last_pos_y = $pos_y gm4_bookshelf_inspector_data
scoreboard players operation @s gm4_bookshelf_inspector_last_pos_z = $pos_z gm4_bookshelf_inspector_data

# if motion was detected set a full cooldown on displaying nametags
# if the player was looking at a bookshelf and the motion was subtle ignore it (to avoid small nudges removing the display)
execute unless score @s gm4_bookshelf_inspector_standing_still matches 8.. if score $distance gm4_bookshelf_inspector_data matches 1.. run scoreboard players set $evaluate gm4_bookshelf_inspector_data -1
execute if score @s gm4_bookshelf_inspector_standing_still matches 8.. if score $distance gm4_bookshelf_inspector_data matches 16.. run scoreboard players set $evaluate gm4_bookshelf_inspector_data -1

# cleanup
data remove storage gm4_bookshelf_inspector:temp Pos

# if player had no motion check rotation
execute if score $evaluate gm4_bookshelf_inspector_data matches 1 run function gm4_bookshelf_inspector:evaluate/rotation
