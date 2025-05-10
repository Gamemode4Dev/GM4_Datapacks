# @s = dash marker
# located at player who started dashing
# run from pneumas/dashing/prepare

# get vector
data modify storage gm4_oa_dashing:temp Pos set from entity @s Pos
execute store result score $motion_x gm4_pneuma_data run data get storage gm4_oa_dashing:temp Pos[0] 1000
execute store result score $motion_z gm4_pneuma_data run data get storage gm4_oa_dashing:temp Pos[2] 1000

scoreboard players operation $motion_x gm4_pneuma_data -= $target_x gm4_pneuma_data
scoreboard players operation $motion_z gm4_pneuma_data -= $target_z gm4_pneuma_data

# additional motion dependent on sneak count
scoreboard players operation $motion_x gm4_pneuma_data *= $multiplier gm4_pneuma_data
scoreboard players operation $motion_z gm4_pneuma_data *= $multiplier gm4_pneuma_data

# set motion
# execute store result entity @s Motion[0] double 0.0045 run scoreboard players get $motion_x gm4_pneuma_data
# execute store result entity @s Motion[2] double 0.0045 run scoreboard players get $motion_z gm4_pneuma_data
# data modify entity @s Motion[1] set value 0.4d

scoreboard players operation $x player_motion.api.launch = $motion_x gm4_pneuma_data
scoreboard players set $y player_motion.api.launch 5200
scoreboard players operation $z player_motion.api.launch = $motion_z gm4_pneuma_data
execute as @a[tag=gm4_oa_dasher,limit=1] run function player_motion:api/launch_xyz

## clean up
data remove storage gm4_oa_dashing:temp Pos
kill @s
