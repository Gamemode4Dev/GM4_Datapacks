#unless the module is already initialized
execute unless score enchantment_extractors gm4_modules matches 1.. run function enchantment_extractors:init
scoreboard players add installedModules gm4_upCheck 1
