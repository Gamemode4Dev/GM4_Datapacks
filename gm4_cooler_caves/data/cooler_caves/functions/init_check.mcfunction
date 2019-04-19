#unless the module is already initialized
execute unless score cooler_caves gm4_modules matches 1.. run function cooler_caves:init
scoreboard players add installed_modules gm4_up_check 1
