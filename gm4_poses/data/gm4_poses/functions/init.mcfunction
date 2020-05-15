scoreboard objectives add gm4_pose_rotA dummy
scoreboard objectives add gm4_pose_rotPx dummy
scoreboard objectives add gm4_pose_rotPy dummy

execute unless score poses gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Poses"}
scoreboard players set poses gm4_modules 1

schedule function gm4_poses:main 1t
schedule function gm4_poses:tick 1t

#$moduleUpdateList
