#unless the module is already initialized
execute unless score orbis gm4_modules matches 1.. run function orbis:init
scoreboard players add installed_modules gm4_up_check 1
