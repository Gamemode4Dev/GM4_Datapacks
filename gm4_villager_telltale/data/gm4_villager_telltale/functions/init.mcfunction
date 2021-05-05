execute unless score villager_telltale gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Villager Telltale"}
scoreboard players set villager_telltale gm4_modules 1

schedule function gm4_villager_telltale:main 10t

#$moduleUpdateList
