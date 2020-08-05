scoreboard objectives add gm4_cb_strcount dummy
scoreboard objectives add gm4_cb_strplace dummy

execute unless score crossbow_cartridges gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Crossbow Cartridges"}
scoreboard players set crossbow_cartridges gm4_modules 1

#$moduleUpdateList
