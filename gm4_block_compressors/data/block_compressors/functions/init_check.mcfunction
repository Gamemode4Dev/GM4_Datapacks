#unless the module is already initialized
execute unless score block_compressors gm4_modules matches 1.. run function block_compressors:init
scoreboard players add installed_modules gm4_up_check 1
