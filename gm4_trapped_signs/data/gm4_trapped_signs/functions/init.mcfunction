scoreboard objectives add gm4_count dummy

execute unless score trapped_signs gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Trapped Signs"}
scoreboard players set trapped_signs gm4_modules 1

schedule function gm4_trapped_signs:main 1t

#$moduleUpdateList
