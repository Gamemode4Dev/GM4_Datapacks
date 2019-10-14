#unless the module is already initialized
execute unless score metallurgy gm4_modules matches 1.. run function metallurgy:init
scoreboard players add installed_modules gm4_up_check 1
