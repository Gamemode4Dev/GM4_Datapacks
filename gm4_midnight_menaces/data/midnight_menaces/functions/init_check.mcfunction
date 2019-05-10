#unless the module is already initialized
execute unless score midnight_menaces gm4_modules matches 1.. run function midnight_menaces:init
scoreboard players add installed_modules gm4_up_check 1
