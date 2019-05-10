#unless the module is already initialized
execute unless score enchantment_extractors gm4_modules matches 1.. run function enchantment_extractors:init
scoreboard players add installed_modules gm4_up_check 1
