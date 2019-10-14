#unless the module is already initialized
execute unless score liquid_minecarts gm4_modules matches 1.. run function liquid_minecarts:init
scoreboard players add installed_modules gm4_up_check 1
