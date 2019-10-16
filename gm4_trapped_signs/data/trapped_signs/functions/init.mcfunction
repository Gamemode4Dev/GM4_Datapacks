scoreboard objectives add gm4_count dummy

scoreboard players set trapped_signs gm4_modules 1

execute unless score trapped_signs gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Trapped Signs"}

schedule function trapped_signs:main 1t

#$moduleUpdateList
