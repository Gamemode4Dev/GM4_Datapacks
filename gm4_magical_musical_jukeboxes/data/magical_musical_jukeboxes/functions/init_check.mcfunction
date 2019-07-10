#unless the module is already initialized
execute unless score magical_musical_jukeboxes gm4_modules matches 1.. run function magical_musical_jukeboxes:init
scoreboard players add installed_modules gm4_up_check 1
