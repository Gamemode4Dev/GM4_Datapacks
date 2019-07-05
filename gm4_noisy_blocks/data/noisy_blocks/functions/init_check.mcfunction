#unless the module is already initialized
execute unless score noisy_blocks gm4_modules matches 1.. run function noisy_blocks:init
scoreboard players add installed_modules gm4_up_check 1