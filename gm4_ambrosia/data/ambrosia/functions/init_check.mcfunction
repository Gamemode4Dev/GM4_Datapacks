#unless the module is already initialized
execute unless score ambrosia gm4_modules matches 1.. run function ambrosia:init
scoreboard players add installed_modules gm4_up_check 1
