scoreboard players set bat_grenades gm4_modules 1

execute unless score bat_grenades gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Bat Grenades"}

schedule function bat_grenades:main 1t

#$moduleUpdateList
