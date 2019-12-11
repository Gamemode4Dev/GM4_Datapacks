scoreboard objectives add gm4_undead minecraft.custom:minecraft.deaths

execute unless score undead_players gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Undead Players"}
scoreboard players set undead_players gm4_modules 1

schedule function undead_players:main 1t

#$moduleUpdateList
