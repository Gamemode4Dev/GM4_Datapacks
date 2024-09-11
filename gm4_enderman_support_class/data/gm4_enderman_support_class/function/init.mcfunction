execute unless score enderman_support_class gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Enderman Support Class"}
execute unless score enderman_support_class gm4_earliest_version < enderman_support_class gm4_modules run scoreboard players operation enderman_support_class gm4_earliest_version = enderman_support_class gm4_modules
scoreboard players set enderman_support_class gm4_modules 1

schedule function gm4_enderman_support_class:main 1t



#$moduleUpdateList
