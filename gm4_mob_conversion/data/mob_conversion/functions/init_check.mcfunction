#unless the module is already initialized
execute unless score mob_conversion gm4_modules matches 1.. run function mob_conversion:init
scoreboard players add installed_modules gm4_up_check 1
