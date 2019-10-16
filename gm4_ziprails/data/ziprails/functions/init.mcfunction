scoreboard players set ziprails gm4_modules 1

execute unless score ziprails gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Ziprails"}

schedule function ziprails:main 1t
schedule function ziprails:tick 1t

#$moduleUpdateList
