execute unless score cozy_campfires gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Cozy Campfires"}
scoreboard players set cozy_campfires gm4_modules 1

schedule function gm4_cozy_campfires:main 10t

#$moduleUpdateList
