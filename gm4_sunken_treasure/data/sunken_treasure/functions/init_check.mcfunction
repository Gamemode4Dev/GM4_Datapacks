#unless the module is already initialized
execute unless score sunken_treasure gm4_modules matches 1.. run function sunken_treasure:init
scoreboard players add installed_modules gm4_up_check 1
