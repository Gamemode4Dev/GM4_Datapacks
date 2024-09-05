# text_display extending tick clock
# @s = extending text_display
# at unspecified
# run from process_display/spawn/tick

scoreboard players add @s gm4_bookshelf_inspector_display_state 1

execute if score @s gm4_bookshelf_inspector_display_state matches 2 run data merge entity @s {start_interpolation:-1,interpolation_duration:2,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.3f,0f],scale:[0.6f,0.6f,0.6f]}}

execute if score @s gm4_bookshelf_inspector_display_state matches 4 run tag @s add gm4_bookshelf_inspector_display.active
execute if score @s gm4_bookshelf_inspector_display_state matches 4 run tag @s remove gm4_bookshelf_inspector_display.extending

execute unless score @s gm4_bookshelf_inspector_display_state matches 4 run scoreboard players set $keep_loop_active gm4_bookshelf_inspector_data 1
