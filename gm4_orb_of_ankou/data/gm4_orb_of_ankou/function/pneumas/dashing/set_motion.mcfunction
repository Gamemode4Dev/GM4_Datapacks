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
scoreboard players operation $x gm4_player_motion.api.launch = $motion_x gm4_pneuma_data
scoreboard players set $y gm4_player_motion.api.launch 5200
scoreboard players operation $z gm4_player_motion.api.launch = $motion_z gm4_pneuma_data
execute as @a[tag=gm4_oa_dasher,limit=1] run function #gm4_player_motion:launch_xyz

## clean up
data remove storage gm4_oa_dashing:temp Pos
kill @s
