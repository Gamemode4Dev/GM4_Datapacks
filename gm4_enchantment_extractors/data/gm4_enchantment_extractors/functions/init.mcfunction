scoreboard objectives add gm4_ench_data dummy
team add gm4_hide_name
team modify gm4_hide_name nametagVisibility never

execute unless score enchantment_extractors gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Enchantment Extractors"}
execute unless score enchantment_extractors gm4_earliest_version < enchantment_extractors gm4_modules run scoreboard players operation enchantment_extractors gm4_earliest_version = enchantment_extractors gm4_modules
scoreboard players set enchantment_extractors gm4_modules 1

schedule function gm4_enchantment_extractors:main 1t



#$moduleUpdateList
