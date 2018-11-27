#unless the module is already initialized
execute unless score heart_canisters gm4_modules matches 1.. run function heart_canisters:init
scoreboard players add installed_modules gm4_up_check 1
