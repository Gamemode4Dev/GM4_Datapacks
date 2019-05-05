#unless the module is already initialized
execute unless score poses_pack gm4_modules matches 1.. run function poses_pack:init
scoreboard players add installed_modules gm4_up_check 1
