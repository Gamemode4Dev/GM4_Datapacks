# check player motion
# @s = player not in spectator mode
# at unspecified
# run from evaluate/run

# store player motion using a marker to avoid reading player NBT
tag @s add gm4_bookshelf_inspector_target
execute summon marker run function gm4_bookshelf_inspector:evaluate/get_pos
tag @s remove gm4_bookshelf_inspector_target

# round down to lowest integer, if all are 0 consider player to not be moving
execute store result score $motion_x gm4_bookshelf_inspector_data run data get storage gm4_bookshelf_inspector:temp Motion[0]
execute store result score $motion_y gm4_bookshelf_inspector_data run data get storage gm4_bookshelf_inspector:temp Motion[1]
execute store result score $motion_z gm4_bookshelf_inspector_data run data get storage gm4_bookshelf_inspector:temp Motion[2]
scoreboard players operation $motion_x gm4_bookshelf_inspector_data += $motion_y gm4_bookshelf_inspector_data
scoreboard players operation $motion_x gm4_bookshelf_inspector_data += $motion_z gm4_bookshelf_inspector_data

# if motion was detected set a full cooldown on displaying nametags
execute if score $motion_x gm4_bookshelf_inspector_data matches 1.. run scoreboard players set $evaluate gm4_bookshelf_inspector_data -1

# cleanup
data remove storage gm4_bookshelf_inspector:temp Motion

# if player had no motion check rotation
execute if score $evaluate gm4_bookshelf_inspector_data matches 1 run function gm4_bookshelf_inspector:evaluate/rotation
