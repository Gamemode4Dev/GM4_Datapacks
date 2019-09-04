#unless the module is already initialized
execute unless score mending_tanks gm4_modules matches 1.. run function mending_tanks:init
scoreboard players add installed_modules gm4_up_check 1
