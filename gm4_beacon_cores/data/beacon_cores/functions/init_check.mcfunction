#unless the module is already initialized
execute unless score beacon_cores gm4_modules matches 1.. run function beacon_cores:init
scoreboard players add installed_modules gm4_up_check 1
