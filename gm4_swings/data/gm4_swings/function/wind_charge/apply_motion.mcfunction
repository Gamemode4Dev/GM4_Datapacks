# Apply motion to a swing from a wind charge
# @s = Item display, swing seat
# at @s
# run from gm4_swings:wind_charge/explode

# get id
scoreboard players operation $id gm4_swings.id = @s gm4_swings.id

# get rotation facing seat from wind charge
execute summon minecraft:marker run function gm4_swings:wind_charge/get_rotation

# add wind charge velocity
data modify storage gm4_swings:data seat_pos set from entity @s Pos
data modify storage gm4_swings:data seat_rotation set from entity @s Rotation[0]
data modify storage gm4_swings:data motion set from entity @p[tag=gm4_swings.interacter,distance=..10] Motion
execute store result storage gm4_swings:data length int 1 run scoreboard players get @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] gm4_swings.length
execute store result score $angular_velocity_addition gm4_swings.dummy run compute default float {type:"minecraft:div",left:"gm4_swings:wind_charge/vector_projection",right:{type:"minecraft:mul",inputs:[{type:"minecraft:storage",storage:"gm4_swings:data",path:"length"},"gm4_swings:conversions/to_radians"]}} -2000000
scoreboard players operation @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] gm4_swings.angular_velocity += $angular_velocity_addition gm4_swings.dummy

# make swing tick
tag @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] add gm4_swings.ticking_swing
