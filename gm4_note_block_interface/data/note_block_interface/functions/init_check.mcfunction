#unless the module is already initialized
execute unless score note_block_interface gm4_modules matches 1.. run function note_block_interface:init
scoreboard players add installed_modules gm4_up_check 1
