#unless the module is already initialized
execute unless score tall_towers gm4_modules matches 1.. run function tall_towers:init
scoreboard players add installed_modules gm4_up_check 1
