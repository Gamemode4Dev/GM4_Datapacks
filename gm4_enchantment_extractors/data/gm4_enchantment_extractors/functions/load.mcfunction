execute if score gm4 load matches 1 run scoreboard players set gm4_enchantment_extractors load 1
execute unless score gm4 load matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Enchantment Extractors",require:"Gamemode 4"}

execute if score gm4_enchantment_extractors load matches 1 run function gm4_enchantment_extractors:init
execute unless score gm4_enchantment_extractors load matches 1 run schedule clear enchantment_extractors:main
