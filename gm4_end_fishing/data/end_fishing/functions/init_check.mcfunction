#unless the module is already initialized
execute unless score end_fishing gm4_modules matches 1.. run function end_fishing:init
scoreboard players add installed_modules gm4_up_check 1
