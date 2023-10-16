# check player rotation
# @s = player not in spectator mode
# at unspecified
# run from evaluate/motion

# read player rotation into scores
data modify storage gm4_bookshelf_nametags:temp Rotation set from entity @s Rotation
execute store result score $yaw gm4_bookshelf_nametags_data run data get storage gm4_bookshelf_nametags:temp Rotation[0]
execute store result score $pitch gm4_bookshelf_nametags_data run data get storage gm4_bookshelf_nametags:temp Rotation[1]
data remove storage gm4_bookshelf_nametags:temp Rotation

# check if pitch and yaw have stayed the same since last check
execute store success score $evaluate gm4_bookshelf_nametags_data if score $pitch gm4_bookshelf_nametags_data = @s gm4_bookshelf_nametags_pitch
execute if score $evaluate gm4_bookshelf_nametags_data matches 1 store success score $evaluate gm4_bookshelf_nametags_data if score $yaw gm4_bookshelf_nametags_data = @s gm4_bookshelf_nametags_yaw

# store player rotation in scores for future checks
scoreboard players operation @s gm4_bookshelf_nametags_pitch = $pitch gm4_bookshelf_nametags_data
scoreboard players operation @s gm4_bookshelf_nametags_yaw = $yaw gm4_bookshelf_nametags_data

# if player had no rotation add to their standing_still score
execute if score $evaluate gm4_bookshelf_nametags_data matches 1 run scoreboard players add @s gm4_bookshelf_nametags_standing_still 1

# if player has not moved for 0.25s check for chiseled bookshelves
# evaluation is not checked here, this means that if you don't move rotation will not reset the 0.5s as long as you keep looking
# at a valid book, making scanning shelves nicer
execute if score @s gm4_bookshelf_nametags_standing_still matches 5.. run function gm4_bookshelf_nametags:find_book/prep
