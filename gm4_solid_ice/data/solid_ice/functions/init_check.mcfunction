#unless the module is already initialized
execute unless score solid_ice gm4_modules matches 1.. run function solid_ice:init
scoreboard players add installed_modules gm4_up_check 1
