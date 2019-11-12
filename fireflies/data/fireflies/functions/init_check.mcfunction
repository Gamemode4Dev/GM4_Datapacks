#unless the module is already initialized
execute unless score fireflies gm4_modules matches 1.. run function fireflies:init
scoreboard players add installed_modules gm4_up_check 1
