scoreboard objectives add gm4_shroom_time dummy
scoreboard objectives add gm4_sporeprint dummy

execute unless score shroomites gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Shroomites"}
scoreboard players set shroomites gm4_modules 1

schedule function gm4_shroomites:main 1t
schedule function gm4_shroomites:tick 1t

#$moduleUpdateList
