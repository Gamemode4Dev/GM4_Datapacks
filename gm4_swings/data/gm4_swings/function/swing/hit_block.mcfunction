tag @s add gm4_swings.hit_block

# invert and damp velocity and set player torque to 0
data modify storage gm4_swings:data angular_velocity set compute default float {type:"minecraft:mul",inputs:[{type:"minecraft:storage",storage:"gm4_swings:data",path:"angular_velocity"},-0.4]}
data modify storage gm4_swings:data player_torque set value 0