#unless the module is already initialized
execute unless score chairs gm4_modules matches 1.. run function chairs:init
scoreboard players add installed_modules gm4_up_check 1
