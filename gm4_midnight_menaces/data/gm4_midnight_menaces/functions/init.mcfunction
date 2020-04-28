scoreboard objectives add gm4_reslimify dummy
scoreboard objectives add gm4_menace dummy
scoreboard players set 100 gm4_menace 100
scoreboard players set 17 gm4_menace 17
scoreboard players set 41 gm4_menace 41

execute unless score midnight_menaces gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Midnight Menaces"}
scoreboard players set midnight_menaces gm4_modules 1

schedule function gm4_midnight_menaces:main 1t

#$moduleUpdateList
