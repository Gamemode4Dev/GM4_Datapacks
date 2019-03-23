#unless the module is already initialized
execute unless score custom_crafters_plus gm4_modules matches 1.. run function custom_crafters_plus:init
scoreboard players add installed_modules gm4_up_check 1
