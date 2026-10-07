scoreboard players operation $id gm4_swings.id = @s gm4_swings.id
tag @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] add gm4_swings.ticking_swing

scoreboard players set $push_torque gm4_swings.dummy 0
data modify storage gm4_swings:temp seat_rotation set from entity @s Rotation[0]
execute store result storage gm4_swings:data length int 1 run scoreboard players get @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] gm4_swings.length
execute as @p[tag=gm4_swings.attacker,distance=..20] run function gm4_swings:seat/push/on_pusher

scoreboard players operation @s gm4_swings.push_torque = $push_torque gm4_swings.dummy