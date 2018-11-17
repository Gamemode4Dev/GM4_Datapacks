#unless the module is already initialized
execute unless score record_crafting gm4_modules matches 1.. run function record_crafting:init
scoreboard players add installed_modules gm4_up_check 1
