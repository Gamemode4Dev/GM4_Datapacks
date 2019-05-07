#unless the module is already initialized
execute unless score firework_assemblers gm4_modules matches 1.. run function firework_assemblers:init
scoreboard players add installed_modules gm4_up_check 1
