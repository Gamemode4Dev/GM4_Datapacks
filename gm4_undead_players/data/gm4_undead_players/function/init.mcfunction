# Add scoreboard used to implement custom logic for undead player drowned conversion.
scoreboard objectives add gm4_undead_drown dummy

execute unless score undead_players gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Undead Players"}
execute unless score undead_players gm4_earliest_version < undead_players gm4_modules run scoreboard players operation undead_players gm4_earliest_version = undead_players gm4_modules
scoreboard players set undead_players gm4_modules 1

schedule function gm4_undead_players:main 1t



#$moduleUpdateList
