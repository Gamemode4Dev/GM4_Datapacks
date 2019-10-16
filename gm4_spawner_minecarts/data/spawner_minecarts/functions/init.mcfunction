scoreboard objectives add gm4_spawner_fuel dummy
scoreboard objectives add gm4_spawner_time dummy
scoreboard objectives add gm4_spawner_data dummy
scoreboard objectives add gm4_sm_flowers dummy
function spawner_minecarts:fuel/initiate_flower_types

scoreboard players set spawner_minecarts gm4_modules 1

execute unless score spawner_minecarts gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Spawner Minecarts"}

schedule function spawner_minecarts:main 1t

#$moduleUpdateList
