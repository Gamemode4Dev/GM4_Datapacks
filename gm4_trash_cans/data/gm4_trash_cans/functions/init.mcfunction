scoreboard objectives add gm4_trash_amount dummy
scoreboard objectives add gm4_trash_rate dummy

execute unless score trash_cans gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Trash Cans"}
scoreboard players set trash_cans gm4_modules 1

schedule function gm4_trash_cans:main 10t

#$moduleUpdateList
