# check player rotation
# @s = player not in spectator mode
# at unspecified
# run from evaluate/motion

# read player rotation into scores
data modify storage gm4_bookshelf_reading:temp Rotation set from entity @s Rotation
execute store result score $pitch gm4_bookshelf_reading_data run data get storage gm4_bookshelf_reading:temp Rotation[0]
execute store result score $yaw gm4_bookshelf_reading_data run data get storage gm4_bookshelf_reading:temp Rotation[1]

# check if pitch and yaw have stayed the same since last check
execute store success score $evaluate gm4_bookshelf_reading_data if score $pitch gm4_bookshelf_reading_data = @s gm4_bookshelf_reading_pitch if score $yaw gm4_bookshelf_reading_data = @s gm4_bookshelf_reading_yaw

# store player rotation in scores for future checks
scoreboard players operation @s gm4_bookshelf_reading_pitch = $pitch gm4_bookshelf_reading_data
scoreboard players operation @s gm4_bookshelf_reading_yaw = $yaw gm4_bookshelf_reading_data

# if player had no rotation add to their standing_still score
execute if score $evaluate gm4_bookshelf_reading_data matches 1 run scoreboard players add @s gm4_bookshelf_reading_standing_still 1

# if player has not moved for 6 ticks check for chiseled bookshelves
execute if score @s gm4_bookshelf_reading_standing_still matches 6.. run function gm4_bookshelf_reading:find_book/prep
