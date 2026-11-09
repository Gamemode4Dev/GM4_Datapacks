# Grab the rotation from the wind charge, facing the swing seat
# @s = Marker
# at @s
# run from gm4_swings:wind_charge/apply_motion

rotate @s facing entity @n[type=minecraft:item_display,tag=gm4_swings.swing_seat,distance=..2.4]
data modify storage gm4_swings:data facing_seat set from entity @s Rotation
kill @s
