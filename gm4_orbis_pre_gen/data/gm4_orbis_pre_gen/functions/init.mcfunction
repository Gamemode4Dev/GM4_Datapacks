scoreboard objectives add gm4_orbis_config dummy
scoreboard players set pre_gen_running gm4_orbis_config 0
scoreboard players set #100 gm4_orbis_config 100
scoreboard players set x1 gm4_orbis_config -1024
scoreboard players set z1 gm4_orbis_config -1024
scoreboard players set x2 gm4_orbis_config 1024
scoreboard players set z2 gm4_orbis_config 1024

execute unless score orbis_pre_gen gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Orbis Pre Gen"}
scoreboard players set orbis_pre_gen gm4_modules 1

schedule function orbis_pre_gen:tick 1t

#$moduleUpdateList
