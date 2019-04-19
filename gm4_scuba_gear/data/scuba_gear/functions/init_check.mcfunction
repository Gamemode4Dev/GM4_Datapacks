#unless the module is already initialized
execute unless score scuba_gear gm4_modules matches 1.. run function scuba_gear:init
scoreboard players add installed_modules gm4_up_check 1
