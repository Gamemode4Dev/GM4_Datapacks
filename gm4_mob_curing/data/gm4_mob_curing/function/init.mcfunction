scoreboard objectives add gm4_mob_curing_data dummy
team add gm4_hide_name
team modify gm4_hide_name nametagVisibility never

execute unless score mob_curing gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Mob Curing"}
execute unless score mob_curing gm4_earliest_version < mob_curing gm4_modules run scoreboard players operation mob_curing gm4_earliest_version = mob_curing gm4_modules
scoreboard players set mob_curing gm4_modules 1

schedule function gm4_mob_curing:main 1t



#$moduleUpdateList
