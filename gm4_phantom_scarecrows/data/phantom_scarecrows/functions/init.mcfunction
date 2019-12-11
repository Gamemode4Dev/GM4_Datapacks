scoreboard objectives add gm4_ps_time dummy
scoreboard players set modulo gm4_ps_time 3

execute unless score phantom_scarecrows gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Phantom Scarecrows"}
scoreboard players set phantom_scarecrows gm4_modules 1

schedule function phantom_scarecrows:main 1t
schedule function phantom_scarecrows:tick 1t

#$moduleUpdateList
