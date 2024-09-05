execute unless score bat_grenades gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Bat Grenades"}
execute unless score bat_grenades gm4_earliest_version < bat_grenades gm4_modules run scoreboard players operation bat_grenades gm4_earliest_version = bat_grenades gm4_modules
scoreboard players set bat_grenades gm4_modules 1

schedule function gm4_bat_grenades:main 1t



#$moduleUpdateList
