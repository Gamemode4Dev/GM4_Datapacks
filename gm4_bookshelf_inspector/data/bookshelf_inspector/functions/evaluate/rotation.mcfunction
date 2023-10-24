# check player rotation
# @s = player not in spectator mode
# at unspecified
# run from evaluate/motion

# read player rotation into scores from storage
execute store result score $yaw gm4_bookshelf_inspector_data run data get storage gm4_bookshelf_inspector:temp Rotation[0]
execute store result score $pitch gm4_bookshelf_inspector_data run data get storage gm4_bookshelf_inspector:temp Rotation[1]
data remove storage gm4_bookshelf_inspector:temp Rotation

# check if pitch and yaw have stayed the same since last check
execute store success score $evaluate gm4_bookshelf_inspector_data if score $pitch gm4_bookshelf_inspector_data = @s gm4_bookshelf_inspector_pitch
execute if score $evaluate gm4_bookshelf_inspector_data matches 1 store success score $evaluate gm4_bookshelf_inspector_data if score $yaw gm4_bookshelf_inspector_data = @s gm4_bookshelf_inspector_yaw

# store player rotation in scores for future checks
scoreboard players operation @s gm4_bookshelf_inspector_pitch = $pitch gm4_bookshelf_inspector_data
scoreboard players operation @s gm4_bookshelf_inspector_yaw = $yaw gm4_bookshelf_inspector_data

# if player had no rotation add to their standing_still score
execute if score $evaluate gm4_bookshelf_inspector_data matches 1 run scoreboard players add @s gm4_bookshelf_inspector_standing_still 1

# if player has not moved for 0.5s and not rotated for 0.1s check for chiseled bookshelves
# evaluation is not checked here, this means that if you don't move rotation will not reset the 0.1s as long as you keep looking
# at a chiseled bookshelf, making scanning shelves nicer
execute if score @s gm4_bookshelf_inspector_standing_still matches 10.. run function gm4_bookshelf_inspector:find_book/prep
