# @s = mob that is nearby a feigning player
# run from pneumas/feigning/apply

# get player pos
data modify storage gm4_orb_of_ankou:temp Pos set from entity @a[tag=gm4_feigning_player,limit=1] Pos
execute store result score $target_x gm4_pneuma_data run data get storage gm4_orb_of_ankou:temp Pos[0]
execute store result score $target_y gm4_pneuma_data run data get storage gm4_orb_of_ankou:temp Pos[1]
execute store result score $target_z gm4_pneuma_data run data get storage gm4_orb_of_ankou:temp Pos[2]

# get vector
data modify storage gm4_orb_of_ankou:temp Pos set from entity @s Pos
execute store result score $motion_x gm4_pneuma_data run data get storage gm4_orb_of_ankou:temp Pos[0]
execute store result score $motion_y gm4_pneuma_data run data get storage gm4_orb_of_ankou:temp Pos[1]
execute store result score $motion_z gm4_pneuma_data run data get storage gm4_orb_of_ankou:temp Pos[2]

scoreboard players operation $motion_x gm4_pneuma_data -= $target_x gm4_pneuma_data
scoreboard players operation $motion_y gm4_pneuma_data -= $target_y gm4_pneuma_data
scoreboard players operation $motion_z gm4_pneuma_data -= $target_z gm4_pneuma_data

# set motion
execute store result entity @s Motion[0] double 1.0 run scoreboard players get $motion_x gm4_pneuma_data
execute store result entity @s Motion[1] double 1.0 run scoreboard players get $motion_y gm4_pneuma_data
execute store result entity @s Motion[2] double 1.0 run scoreboard players get $motion_z gm4_pneuma_data

# clean up
scoreboard players reset $motion_x gm4_pneuma_data
scoreboard players reset $motion_y gm4_pneuma_data
scoreboard players reset $motion_z gm4_pneuma_data
scoreboard players reset $target_x gm4_pneuma_data
scoreboard players reset $target_y gm4_pneuma_data
scoreboard players reset $target_z gm4_pneuma_data
