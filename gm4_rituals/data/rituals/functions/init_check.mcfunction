#unless the module is already initialized
execute unless score rituals gm4_modules matches 1.. run function rituals:init
scoreboard players add installed_modules gm4_up_check 1
