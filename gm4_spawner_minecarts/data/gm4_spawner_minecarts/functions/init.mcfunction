scoreboard objectives add gm4_spawner_fuel dummy
scoreboard objectives add gm4_spawner_time dummy
scoreboard objectives add gm4_spawner_data dummy
scoreboard objectives add gm4_sm_flowers dummy
execute unless score required_flowers gm4_sm_flowers matches -2147483648..2147483647 run function gm4_spawner_minecarts:fuel/initiate_flower_types

execute unless score spawner_minecarts gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Spawner Minecarts"}
execute unless score spawner_minecarts gm4_earliest_version < spawner_minecarts gm4_modules run scoreboard players operation spawner_minecarts gm4_earliest_version = spawner_minecarts gm4_modules
scoreboard players set spawner_minecarts gm4_modules 1

schedule function gm4_spawner_minecarts:main 1t



#$moduleUpdateList
