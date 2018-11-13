#unless the module is already initialized
execute unless score ender_hoppers gm4_modules matches 1.. run function ender_hoppers:init
scoreboard players add installed_modules gm4_up_check 1
