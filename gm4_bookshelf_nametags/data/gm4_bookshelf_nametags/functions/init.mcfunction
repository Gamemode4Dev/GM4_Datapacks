execute unless score bookshelf_nametags gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Bookshelf Nametags"}
execute unless score bookshelf_nametags gm4_earliest_version < bookshelf_nametags gm4_modules run scoreboard players operation bookshelf_nametags gm4_earliest_version = bookshelf_nametags gm4_modules
scoreboard players set bookshelf_nametags gm4_modules 1

scoreboard objectives add gm4_bookshelf_nametags_data dummy
scoreboard objectives add gm4_bookshelf_nametags_pitch dummy
scoreboard objectives add gm4_bookshelf_nametags_yaw dummy
scoreboard objectives add gm4_bookshelf_nametags_standing_still dummy
scoreboard objectives add gm4_bookshelf_nametags_keep dummy
scoreboard objectives add gm4_bookshelf_nametags_walk custom:walk_one_cm
scoreboard objectives add gm4_bookshelf_nametags_sprint custom:sprint_one_cm

scoreboard players set #100 gm4_bookshelf_nametags_data 100

schedule function gm4_bookshelf_nametags:main 1t

#$moduleUpdateList
