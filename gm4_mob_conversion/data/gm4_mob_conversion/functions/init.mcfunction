scoreboard objectives add gm4_mob_con_data dummy
scoreboard players set #8 gm4_mob_con_data 8
scoreboard players set #5 gm4_mob_con_data 5
scoreboard players set #-1 gm4_mob_con_data -1

execute unless score mob_conversion gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Mob Conversion"}
scoreboard players set mob_conversion gm4_modules 1

schedule function gm4_mob_conversion:main 1t
schedule function gm4_mob_conversion:tick 1t

#$moduleUpdateList
