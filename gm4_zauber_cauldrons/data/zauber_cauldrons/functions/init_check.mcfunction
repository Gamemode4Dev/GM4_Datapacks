#unless the module is already initialized
execute unless score zauber_cauldrons gm4_modules matches 1.. run function zauber_cauldrons:init
scoreboard players add installed_modules gm4_up_check 1
