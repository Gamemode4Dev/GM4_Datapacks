#unless the module is already initialized
execute unless score sharpening_tools gm4_modules matches 1.. run function sharpening_tools:init
scoreboard players add installed_modules gm4_up_check 1
