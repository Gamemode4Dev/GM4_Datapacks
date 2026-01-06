# @s = player who changed dimensions or joined for the first time
# run from advancements "change_dimension" and "join"

advancement revoke @s only gm4_forceload:change_dimension

# exit if the dimension is already initialized
execute if block 29999998 1 7133 birch_wall_sign run return 0

function gm4_forceload:init_chunk

# spawn dimension marker with scoreboard ID and name
tag @s add gm4_in_new_dimension
execute summon minecraft:marker in minecraft:overworld run function gm4_forceload:set_marker_data
tag @s remove gm4_in_new_dimension
