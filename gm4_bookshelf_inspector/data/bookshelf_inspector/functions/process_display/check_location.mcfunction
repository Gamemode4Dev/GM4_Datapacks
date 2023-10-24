# check if text_display exists in this location, if so update it, otherwise spawn a new one
# @s = player not in spectator mode
# at chiseled bookshelf positioned at book slot
# run from process_display/locate_slot

# check for existing display
execute store success score $display_found gm4_bookshelf_inspector_data run scoreboard players set @e[type=text_display,tag=gm4_bookshelf_inspector_display,distance=..0.01] gm4_bookshelf_inspector_keep 1

# spawn new display
execute if score $display_found gm4_bookshelf_inspector_data matches 0 summon text_display run function gm4_bookshelf_inspector:process_display/spawn/init
