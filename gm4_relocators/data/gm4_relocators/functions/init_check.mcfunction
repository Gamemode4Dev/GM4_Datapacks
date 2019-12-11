#unless the module is already initialized
execute unless score relocators gm4_modules matches 1.. run function gm4_relocators:init
scoreboard players add installed_modules gm4_up_check 1
