execute unless score ender_hoppers gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Ender Hoppers"}
execute unless score ender_hoppers gm4_earliest_version < ender_hoppers gm4_modules run scoreboard players operation ender_hoppers gm4_earliest_version = ender_hoppers gm4_modules
scoreboard players set ender_hoppers gm4_modules 1

schedule function gm4_ender_hoppers:main 1t

#$moduleUpdateList
