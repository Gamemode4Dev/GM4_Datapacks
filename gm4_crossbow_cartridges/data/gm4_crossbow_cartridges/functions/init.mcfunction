execute unless score crossbow_cartridges gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Crossbow Cartridges"}
scoreboard players set crossbow_cartridges gm4_modules 1

schedule function gm4_crossbow_cartridges:main 1t

#$moduleUpdateList
