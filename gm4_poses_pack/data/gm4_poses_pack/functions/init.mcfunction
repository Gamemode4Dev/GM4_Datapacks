scoreboard objectives add gm4_poses_data dummy
scoreboard players set #max_rot gm4_poses_data -90

execute unless score poses_pack gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Poses Pack"}
scoreboard players set poses_pack gm4_modules 1

#$moduleUpdateList
