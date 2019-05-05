#unless the module is already initialized
execute unless score dispenser_fireworks gm4_modules matches 1.. run function dispenser_fireworks:init
scoreboard players add installed_modules gm4_up_check 1
