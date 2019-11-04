#unless the module is already initialized
execute unless score chestpack gm4_modules matches 1.. run function chestpack:init
scoreboard players add installed_modules gm4_up_check 1
