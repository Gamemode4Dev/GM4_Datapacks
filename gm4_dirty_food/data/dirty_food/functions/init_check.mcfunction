#unless the module is already initialized
execute unless score dirty_food gm4_modules matches 1.. run function dirty_food:init
scoreboard players add installed_modules gm4_up_check 1
