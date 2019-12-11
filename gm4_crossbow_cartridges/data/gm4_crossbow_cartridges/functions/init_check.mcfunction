#unless the module is already initialized
execute unless score crossbow_cartridges gm4_modules matches 1.. run function gm4_crossbow_cartridges:init
scoreboard players add installed_modules gm4_up_check 1
