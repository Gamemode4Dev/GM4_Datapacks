# Check for nearby swings when a wind charge explodes
# @s = Wind charge, one that has not been marked previously
# at @s
# run from gm4_swings:tick

data modify storage gm4_swings:data wind_charge_pos set from entity @s Pos
kill @s

execute as @n[type=minecraft:item_display,tag=gm4_swings.swing_seat,distance=..2.4] run function gm4_swings:wind_charge/apply_motion
