#unless the module is already initialized
execute unless score cement_mixers gm4_modules matches 1.. run function cement_mixers:init
scoreboard players add installed_modules gm4_up_check 1
