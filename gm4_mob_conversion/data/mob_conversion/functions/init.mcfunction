scoreboard objectives add gm4_mob_con_data dummy

execute unless score mob_conversion gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Mob Conversion"}
scoreboard players set mob_conversion gm4_modules 1

schedule function mob_conversion:main 1t
schedule function mob_conversion:tick 1t

#$moduleUpdateList
