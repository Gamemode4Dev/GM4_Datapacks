scoreboard objectives add gm4_ps_time dummy
scoreboard players set modulo gm4_ps_time 3
scoreboard objectives add gm4_entity_version dummy

execute unless score phantom_scarecrows gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Phantom Scarecrows"}
execute unless score phantom_scarecrows gm4_earliest_version < phantom_scarecrows gm4_modules run scoreboard players operation phantom_scarecrows gm4_earliest_version = phantom_scarecrows gm4_modules
scoreboard players set phantom_scarecrows gm4_modules 1

schedule function gm4_phantom_scarecrows:main 1t
schedule function gm4_phantom_scarecrows:tick 1t



#$moduleUpdateList
