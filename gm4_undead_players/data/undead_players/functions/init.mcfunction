scoreboard objectives add gm4_undead minecraft.custom:minecraft.deaths

scoreboard players set undead_players gm4_modules 1

execute unless score undead_players gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Undead Players"}

schedule function undead_players:main 1t

#$moduleUpdateList
