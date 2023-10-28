execute unless score bookshelf_inspector gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Bookshelf Inspector"}
execute unless score bookshelf_inspector gm4_earliest_version < bookshelf_inspector gm4_modules run scoreboard players operation bookshelf_inspector gm4_earliest_version = bookshelf_inspector gm4_modules
scoreboard players set bookshelf_inspector gm4_modules 1

scoreboard objectives add gm4_bookshelf_inspector_data dummy
scoreboard objectives add gm4_bookshelf_inspector_pitch dummy
scoreboard objectives add gm4_bookshelf_inspector_yaw dummy
scoreboard objectives add gm4_bookshelf_inspector_standing_still dummy
scoreboard objectives add gm4_bookshelf_inspector_keep dummy
scoreboard objectives add gm4_bookshelf_inspector_display_state dummy
scoreboard objectives add gm4_bookshelf_inspector_walk custom:walk_one_cm
scoreboard objectives add gm4_bookshelf_inspector_sprint custom:sprint_one_cm
scoreboard objectives add gm4_bookshelf_inspector_fall custom:fall_one_cm
scoreboard objectives add gm4_bookshelf_inspector_last_pos_x dummy
scoreboard objectives add gm4_bookshelf_inspector_last_pos_y dummy
scoreboard objectives add gm4_bookshelf_inspector_last_pos_z dummy

scoreboard players set #-1 gm4_bookshelf_inspector_data -1
scoreboard players set #100 gm4_bookshelf_inspector_data 100

schedule function gm4_bookshelf_inspector:main 1t

#$moduleUpdateList
