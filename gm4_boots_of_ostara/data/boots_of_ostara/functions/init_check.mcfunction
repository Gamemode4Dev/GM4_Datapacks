#unless the module is already initialized
execute unless score boots_of_ostara gm4_modules matches 1.. run function boots_of_ostara:init
scoreboard players add installed_modules gm4_up_check 1
