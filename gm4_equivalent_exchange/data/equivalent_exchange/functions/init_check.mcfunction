#unless the module is already initialized
execute unless score equivalent_exchange gm4_modules matches 1.. run function equivalent_exchange:init
scoreboard players add installed_modules gm4_up_check 1
