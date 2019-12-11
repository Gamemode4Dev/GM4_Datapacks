scoreboard objectives add gm4_ench_random dummy
execute unless score seed gm4_ench_random matches 0.. run scoreboard players set seed gm4_ench_random 731031
scoreboard players set mult gm4_ench_random 1664525
scoreboard players set incr gm4_ench_random 1013904223
scoreboard players set #100 gm4_ench_random 100

execute unless score enchantment_extractors gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Enchantment Extractors"}
scoreboard players set enchantment_extractors gm4_modules 1

schedule function gm4_enchantment_extractors:main 1t

#$moduleUpdateList
