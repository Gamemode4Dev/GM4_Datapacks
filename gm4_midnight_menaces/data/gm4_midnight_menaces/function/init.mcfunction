scoreboard objectives add gm4_reslimify dummy
scoreboard objectives add gm4_menace_data dummy
scoreboard players set 100 gm4_menace_data 100
scoreboard players set 17 gm4_menace_data 17
scoreboard players set 21 gm4_menace_data 21
scoreboard players set 2 gm4_menace_data 2
scoreboard objectives add gm4_entity_version dummy
team add gm4_hide_name
team modify gm4_hide_name nametagVisibility never

execute unless score midnight_menaces gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Midnight Menaces"}
execute unless score midnight_menaces gm4_earliest_version < midnight_menaces gm4_modules run scoreboard players operation midnight_menaces gm4_earliest_version = midnight_menaces gm4_modules
scoreboard players set midnight_menaces gm4_modules 1

schedule function gm4_menacing_goblins:main 1t



#$moduleUpdateList
