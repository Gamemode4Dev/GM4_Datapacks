# text_display removing tick clock
# @s = removing text_display
# at unspecified
# run from process_display/remove/tick

scoreboard players add @s gm4_bookshelf_inspector_display_state 1

execute if score @s gm4_bookshelf_inspector_display_state matches 6 run data merge entity @s {start_interpolation:-1,interpolation_duration:5,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0f,0f,0f]}}
execute unless score @s gm4_bookshelf_inspector_display_state matches 9 run scoreboard players set $keep_loop_active gm4_bookshelf_inspector_data 1
execute if score @s gm4_bookshelf_inspector_display_state matches 9 run kill @s
