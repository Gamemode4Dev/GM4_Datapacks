#unless the module is already initialized
execute unless score dangerous_dungeons gm4_modules matches 1.. run function dangerous_dungeons:init
scoreboard players add installed_modules gm4_up_check 1
