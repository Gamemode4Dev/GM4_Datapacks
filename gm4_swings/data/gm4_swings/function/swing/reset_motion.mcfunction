# Stops a swing from moving and ticking, ran when the swing gets slow enough and is near its rest point
# @s = Item display, swing main body
# at @s
# run from gm4_swings:swing/tick

scoreboard players set @s gm4_swings.angular_velocity 0
data modify storage gm4_swings:data new_rotation set value 0
tag @s remove gm4_swings.ticking_swing
