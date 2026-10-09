execute if entity @s[tag=gm4_swings.has_player] run return fail

# get id
scoreboard players operation $id gm4_swings.id = @s gm4_swings.id

# add player velocity
data modify storage gm4_swings:data seat_rotation set from entity @s Rotation[0]
data modify storage gm4_swings:data player_motion set from entity @p[tag=gm4_swings.interacter,distance=..10] Motion
execute store result score @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] gm4_swings.angular_velocity run compute default float gm4_swings:vector_projection -10000000

# mount player
tag @p[tag=gm4_swings.interacter,distance=..10] add gm4_swings.swing_sitter
ride @p[tag=gm4_swings.interacter,distance=..10] dismount
ride @p[tag=gm4_swings.interacter,distance=..10] mount @s
tag @s add gm4_swings.has_player

# make swing tick
tag @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] add gm4_swings.ticking_swing
