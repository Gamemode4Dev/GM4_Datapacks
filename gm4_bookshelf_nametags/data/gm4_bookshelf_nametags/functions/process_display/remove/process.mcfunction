# text_display removing tick clock
# @s = removing text_display
# at unspecified
# run from process_display/remove/tick

scoreboard players add @s gm4_bookshelf_nametags_data 1

execute if score @s gm4_bookshelf_nametags_data matches 6 run data merge entity @s {start_interpolation:-1,interpolation_duration:3,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0f,0f,0f]}}
execute if score @s gm4_bookshelf_nametags_data matches 8 run kill @s
