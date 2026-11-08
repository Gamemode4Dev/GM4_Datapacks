# Seat an entity on the swing
# @s = Item display, swing seat
# at @s
# run from gm4_swings:interact/on_interaction

# check if seat filled already
execute on passengers if entity @s[type=!#gm4:non_living] run return fail

# get id
scoreboard players operation $id gm4_swings.id = @s gm4_swings.id

# setup sitter
execute as @n[type=minecraft:player,tag=gm4_swings.interacter,distance=..10] run function gm4_swings:seat/sit/on_sitter

# mount the entity
ride @n[type=!#gm4:non_living,tag=gm4_swings.interacter,distance=..10] mount @s

# tag appropriately
execute if score $is_player gm4_swings.dummy matches 1 run tag @s add gm4_swings.has_player

# add entity velocity
data modify storage gm4_swings:data seat_rotation set from entity @s Rotation[0]
execute store result storage gm4_swings:data length int 1 run scoreboard players get @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] gm4_swings.length
execute store result score $angular_velocity_addition gm4_swings.dummy run compute default float {type:"minecraft:div",left:"gm4_swings:vector_projection",right:{type:"minecraft:mul",inputs:[{type:"minecraft:storage",storage:"gm4_swings:data",path:"length"},"gm4_swings:conversions/to_radians"]}} -2000000
scoreboard players operation @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] gm4_swings.angular_velocity += $angular_velocity_addition gm4_swings.dummy

# make swing tick
tag @n[type=minecraft:item_display,tag=gm4_swings.swing,predicate=gm4_swings:id_match] add gm4_swings.ticking_swing
