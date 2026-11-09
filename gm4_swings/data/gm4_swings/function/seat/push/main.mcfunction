# Apply motion to a swing from a player pushing it (punching the seat interaction)
# @s = Item display, swing seat
# at @s
# run from gm4_swings:interactions/hit/on_interaction

scoreboard players operation $id gm4_swings.id = @s gm4_swings.id

# make swing tick
tag @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] add gm4_swings.ticking_swing

# calculate new motion
scoreboard players set $push_torque gm4_swings.dummy 0
data modify storage gm4_swings:temp seat_rotation set from entity @s Rotation[0]
execute store result storage gm4_swings:data length int 1 run scoreboard players get @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] gm4_swings.length
execute as @p[tag=gm4_swings.attacker,distance=..20] run function gm4_swings:seat/push/on_pusher

# apply the motion
scoreboard players operation @s gm4_swings.push_torque = $push_torque gm4_swings.dummy
