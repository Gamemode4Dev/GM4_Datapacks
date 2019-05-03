#unless the module is already initialized
execute unless score damaging_stonecutters gm4_modules matches 1.. run function damaging_stonecutters:init
scoreboard players add installed_modules gm4_up_check 1
