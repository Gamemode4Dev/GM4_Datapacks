scoreboard objectives add gm4_cb_string dummy
scoreboard objectives add gm4_cb_tw_hook dummy
scoreboard objectives add gm4_cb_tw_length dummy

execute unless score crossbow_cartridges gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Crossbow Cartridges"}
execute unless score crossbow_cartridges gm4_earliest_version < crossbow_cartridges gm4_modules run scoreboard players operation crossbow_cartridges gm4_earliest_version = crossbow_cartridges gm4_modules
scoreboard players set crossbow_cartridges gm4_modules 1



#$moduleUpdateList
