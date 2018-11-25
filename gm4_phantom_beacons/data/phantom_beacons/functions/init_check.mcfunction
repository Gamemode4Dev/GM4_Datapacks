#unless the module is already initialized
execute unless score phantom_beacons gm4_modules matches 1.. run function phantom_beacons:init
scoreboard players add installed_modules gm4_up_check 1
