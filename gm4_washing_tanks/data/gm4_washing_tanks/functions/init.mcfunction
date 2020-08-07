execute unless score washing_tanks gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Washing Tanks"}
scoreboard players set washing_tanks gm4_modules 1
scoreboard objectives add gm4_wt_tag_size dummy

#$moduleUpdateList
