#unless the module is already initialized
execute unless score undead_players gm4_modules matches 1.. run function undead_players:init
scoreboard players add installed_modules gm4_up_check 1
