# text_display extending tick clock
# @s = extending text_display
# at unspecified
# run from process_display/spawn/tick

scoreboard players add @s gm4_bookshelf_nametags_data 1

execute if score @s gm4_bookshelf_nametags_data matches 2 run data merge entity @s {start_interpolation:-1,interpolation_duration:2,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.3f,0f],scale:[0.6f,0.6f,0.6f]}}

execute if score @s gm4_bookshelf_nametags_data matches 4 run tag @s add gm4_bookshelf_nametags_display.active
execute if score @s gm4_bookshelf_nametags_data matches 4 run tag @s remove gm4_bookshelf_nametags_display.extending
