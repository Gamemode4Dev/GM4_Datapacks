scoreboard objectives add gm4_rol_data dummy

execute unless score rope_ladders gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Rope Ladders"}
scoreboard players set rope_ladders gm4_modules 1

schedule function gm4_rope_ladders:main 10t
schedule function gm4_rope_ladders:10t 11t

#$moduleUpdateList
