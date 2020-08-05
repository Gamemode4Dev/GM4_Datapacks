scoreboard objectives add gm4_pose_rotA dummy
scoreboard objectives add gm4_pose_rotPx dummy
scoreboard objectives add gm4_pose_rotPy dummy

execute unless score poses_pack gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Poses Pack"}
scoreboard players set poses_pack gm4_modules 1

#$moduleUpdateList
