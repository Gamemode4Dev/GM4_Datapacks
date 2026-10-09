execute if entity @s[tag=gm4_swings.has_player] run return fail

# get id
scoreboard players operation $id gm4_swings.id = @s gm4_swings.id

# add player velocity
data modify storage gm4_swings:data seat_rotation set from entity @s Rotation[0]
data modify storage gm4_swings:data player_motion set from entity @p[tag=gm4_swings.interacter,distance=..10] Motion
execute store result storage gm4_swings:data length int 1 run scoreboard players get @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] gm4_swings.length
execute store result score $angular_velocity_addition gm4_swings.dummy run compute default float {type:"minecraft:div",left:"gm4_swings:vector_projection",right:{type:"minecraft:storage",storage:"gm4_swings:data",path:"length"}} -20000000
scoreboard players operation @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] gm4_swings.angular_velocity += $angular_velocity_addition gm4_swings.dummy

# mount player
tag @p[tag=gm4_swings.interacter,distance=..10] add gm4_swings.swing_sitter
ride @p[tag=gm4_swings.interacter,distance=..10] dismount
ride @p[tag=gm4_swings.interacter,distance=..10] mount @s
tag @s add gm4_swings.has_player

# make swing tick
tag @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] add gm4_swings.ticking_swing
