

# link armor stand to player
scoreboard players operation @s gm4_oa_id = $current gm4_oa_id

# get vector
data modify storage gm4_oa_dashing:temp Pos set from entity @s Pos
execute store result score $motion_x gm4_pneuma_data run data get storage gm4_oa_dashing:temp Pos[0] 100
execute store result score $motion_z gm4_pneuma_data run data get storage gm4_oa_dashing:temp Pos[2] 100

scoreboard players operation $motion_x gm4_pneuma_data -= $target_x gm4_pneuma_data
scoreboard players operation $motion_z gm4_pneuma_data -= $target_z gm4_pneuma_data

# additional motion dependent on sneak count
scoreboard players operation $motion_x gm4_pneuma_data *= $multiplier gm4_pneuma_data
scoreboard players operation $motion_z gm4_pneuma_data *= $multiplier gm4_pneuma_data

# set motion
execute store result entity @s Motion[0] double 0.0045 run scoreboard players get $motion_x gm4_pneuma_data
execute store result entity @s Motion[2] double 0.0045 run scoreboard players get $motion_z gm4_pneuma_data
data modify entity @s Motion[1] set value 0.4d

## clean up
data remove storage gm4_oa_dashing:temp Pos
