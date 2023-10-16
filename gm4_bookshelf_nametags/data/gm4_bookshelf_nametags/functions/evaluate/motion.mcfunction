# check player motion
# @s = player not in spectator mode
# at unspecified
# run from evaluate/run

# store player motion, round down to lowest integer, if all are 0 consider player to not be moving
data modify storage gm4_bookshelf_nametags:temp Motion set from entity @s Motion
execute store result score $Mot_0 gm4_bookshelf_nametags_data run data get storage gm4_bookshelf_nametags:temp Motion[0]
execute store result score $Mot_1 gm4_bookshelf_nametags_data run data get storage gm4_bookshelf_nametags:temp Motion[1]
execute store result score $Mot_2 gm4_bookshelf_nametags_data run data get storage gm4_bookshelf_nametags:temp Motion[2]
scoreboard players operation $Mot_0 gm4_bookshelf_nametags_data += $Mot_1 gm4_bookshelf_nametags_data
scoreboard players operation $Mot_0 gm4_bookshelf_nametags_data += $Mot_2 gm4_bookshelf_nametags_data
execute if score $Mot_0 gm4_bookshelf_nametags_data matches 1.. run scoreboard players set $evaluate gm4_bookshelf_nametags_data 0
data remove storage gm4_bookshelf_nametags:temp Motion

# if player had no motion check rotation
execute if score $evaluate gm4_bookshelf_nametags_data matches 1 run function gm4_bookshelf_nametags:evaluate/rotation
