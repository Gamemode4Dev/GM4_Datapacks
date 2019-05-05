#unless the module is already initialized
execute unless score sweethearts gm4_modules matches 1.. run function sweethearts:init
scoreboard players add installed_modules gm4_up_check 1
