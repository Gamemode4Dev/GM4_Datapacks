execute unless score spawner_minecarts gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Spawner Minecarts"}
execute unless score spawner_minecarts gm4_earliest_version < spawner_minecarts gm4_modules run scoreboard players operation spawner_minecarts gm4_earliest_version = spawner_minecarts gm4_modules
scoreboard players set spawner_minecarts gm4_modules 1

scoreboard objectives add gm4_spawner_minecarts_data dummy

schedule function gm4_spawner_minecarts:main 1t



#$moduleUpdateList
