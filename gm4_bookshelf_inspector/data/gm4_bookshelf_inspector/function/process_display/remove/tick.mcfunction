# text_display removing tick clock
# @s = unspecified
# at unspecified
# schedule from process_display/remove/init
# schedule from here

scoreboard players set $keep_loop_active gm4_bookshelf_inspector_data 0

execute as @e[type=text_display,tag=gm4_bookshelf_inspector_display.removing] run function gm4_bookshelf_inspector:process_display/remove/process

execute if score $keep_loop_active gm4_bookshelf_inspector_data matches 1 run schedule function gm4_bookshelf_inspector:process_display/remove/tick 1t
