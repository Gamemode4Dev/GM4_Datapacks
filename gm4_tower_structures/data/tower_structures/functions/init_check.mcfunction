#unless the module is already initialized
execute unless score tower_structures gm4_modules matches 1.. run function tower_structures:init
scoreboard players add installed_modules gm4_up_check 1
