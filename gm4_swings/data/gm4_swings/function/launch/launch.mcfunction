tag @s remove gm4_swings.swing_sitter
execute if data storage gm4_swings:temp {motion:0} run return fail

# scale velocity
execute store result score $strength gm4_player_motion.api.launch run compute default integer {type:"minecraft:div",left:{type:"minecraft:mul",inputs:[{type:"minecraft:storage",storage:"gm4_swings:temp",path:"motion"},-1]},right:400}

# chuck em boys
function #gm4_player_motion:launch_looking
