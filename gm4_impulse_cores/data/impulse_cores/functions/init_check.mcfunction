#unless the module is already initialized
execute unless score impulse_cores gm4_modules matches 1.. run function impulse_cores:init
scoreboard players add installed_modules gm4_up_check 1
