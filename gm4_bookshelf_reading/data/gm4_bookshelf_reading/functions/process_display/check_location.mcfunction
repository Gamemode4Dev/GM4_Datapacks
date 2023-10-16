# check if text_display exists in this location, if so update it, otherwise spawn a new one
# @s = player not in spectator mode
# at chiseled bookshelf positioned at book slot
# run from process_display/locate_slot

scoreboard players set $display_found gm4_bookshelf_reading_data 0
execute as @e[type=text_display,tag=gm4_bookshelf_reading_display.active,distance=..0.01] run function gm4_bookshelf_reading:process_display/update
execute if score $display_found gm4_bookshelf_reading_data matches 0 summon text_display run function gm4_bookshelf_reading:process_display/spawn/init
