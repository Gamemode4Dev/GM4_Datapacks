execute if score gm4 load.status matches 1 if score gm4_custom_crafters load.status matches 2 if score gm4_machines load.status matches 1 run scoreboard players set gm4_enchantment_extractors load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Enchantment Extractors",require:"Gamemode 4"}
execute unless score gm4_machines load.status matches 2 run data modify storage gm4:log queue append value {type:"missing",module:"Enchantment Extractors",require:"Custom Crafters"}
execute unless score gm4_machines load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Enchantment Extractors",require:"lib_machines"}

execute if score gm4_enchantment_extractors load.status matches 1 run function gm4_enchantment_extractors:init
execute unless score gm4_enchantment_extractors load.status matches 1 run schedule clear gm4_enchantment_extractors:main
