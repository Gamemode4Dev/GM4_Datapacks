#unless the module is already initialized
execute unless score MODULE_ID gm4_modules matches 1.. run function MODULE_ID:init
scoreboard players add installed_modules gm4_up_check 1
