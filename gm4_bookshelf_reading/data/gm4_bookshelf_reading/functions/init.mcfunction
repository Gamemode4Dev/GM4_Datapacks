execute unless score bookshelf_reading gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Bookshelf Reading"}
execute unless score bookshelf_reading gm4_earliest_version < bookshelf_reading gm4_modules run scoreboard players operation bookshelf_reading gm4_earliest_version = bookshelf_reading gm4_modules
scoreboard players set bookshelf_reading gm4_modules 1

scoreboard objectives add gm4_bookshelf_reading_data dummy
scoreboard objectives add gm4_bookshelf_reading_pitch dummy
scoreboard objectives add gm4_bookshelf_reading_yaw dummy
scoreboard objectives add gm4_bookshelf_reading_standing_still dummy
scoreboard objectives add gm4_bookshelf_reading_keep dummy
scoreboard objectives add gm4_bookshelf_reading_walk custom:walk_one_cm
scoreboard objectives add gm4_bookshelf_reading_sprint custom:sprint_one_cm

scoreboard players set #100 gm4_bookshelf_reading_data 100

schedule function gm4_bookshelf_reading:main 1t

#$moduleUpdateList
