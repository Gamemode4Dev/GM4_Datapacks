#unless the module is already initialized
execute unless score spawner_minecarts gm4_modules matches 1.. run function spawner_minecarts:init
scoreboard players add installed_modules gm4_upCheck 1
