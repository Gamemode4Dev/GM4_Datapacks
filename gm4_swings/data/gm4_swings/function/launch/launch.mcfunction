# Launch a player, calculating velocity from the swing's angular motion
# @s = Player, that dismounted a swing in the last tick
# at swing sweat rotated as swing seat
# run from gm4_swings:launch/main

tag @s remove gm4_swings.swing_sitter
execute if data storage gm4_swings:data {angular_velocity:0} run return fail

# calculate velocity
scoreboard players set $x gm4_player_motion.api.launch 0
scoreboard players set $y gm4_player_motion.api.launch 0
execute store result score $z gm4_player_motion.api.launch run compute default float {type:"minecraft:mul",inputs:[{type:"minecraft:storage",storage:"gm4_swings:data",path:"angular_velocity"},{type:"minecraft:storage",storage:"gm4_swings:data",path:"length"},"gm4_swings:conversions/to_radians",-20000]}

# chuck em boys
function #gm4_player_motion:launch_local_xyz
