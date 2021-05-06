scoreboard objectives add gm4_rv_trade dummy

execute unless score rational_villagers gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"rational villagers"}
scoreboard players set rational_villagers gm4_modules 1

schedule function gm4_rational_villagers:main 10t

#$moduleUpdateList
