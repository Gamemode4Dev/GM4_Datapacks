tag @s remove gm4_swings.swing_sitter
execute if data storage gm4_swings:data {angular_velocity:0} run return fail

# calculate velocity
execute store result score $strength gm4_player_motion.api.launch run compute default float {type:"minecraft:mul",inputs:[{type:"minecraft:storage",storage:"gm4_swings:data",path:"angular_velocity"},{type:"minecraft:storage",storage:"gm4_swings:data",path:"length"},"gm4_swings:conversions/to_radians",-20000]}

# chuck em boys
function #gm4_player_motion:launch_looking
