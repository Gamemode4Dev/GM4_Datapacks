#unless the module is already initialized
execute unless score orbis_pre_gen gm4_modules matches 1.. run function orbis_pre_gen:init
scoreboard players add installed_modules gm4_up_check 1
