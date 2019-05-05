#unless the module is already initialized
execute unless score disassemblers gm4_modules matches 1.. run function disassemblers:init
scoreboard players add installed_modules gm4_up_check 1
