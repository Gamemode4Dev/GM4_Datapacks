#unless the module is already initialized
execute unless score holographic_tags gm4_modules matches 1.. run function holographic_tags:init
scoreboard players add installed_modules gm4_up_check 1
