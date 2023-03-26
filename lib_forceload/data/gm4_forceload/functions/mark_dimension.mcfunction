# @s = player who entered a new dimension
# run from advancement dimension_marking and function load

function gm4_forceload:init_chunk

# spawn dimension marker
summon minecraft:marker ~ 0 ~ {Tags:["gm4_dimension","gm4_new_dimension"]}

# give dimension marker a scoreboard ID and name
tag @s add gm4_in_new_dimension
execute as @e[type=marker,tag=gm4_new_dimension,limit=1] in minecraft:overworld run function gm4_forceload:set_marker_data

# remove temporary tags
tag @s remove gm4_in_new_dimension
