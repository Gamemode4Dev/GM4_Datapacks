# @s = player who entered a new dimension
# run from advancement dimension_marking and function load

function gm4_forceload-1.0:init_chunk

# spawn dimension marker		
summon minecraft:area_effect_cloud 29999999 0 7135 {Duration:2147483647,Tags:["gm4_dimension","gm4_new_dimension"]}
 
# give dimension marker a scoreboard ID and name
tag @s add gm4_in_new_dimension
execute as @e[type=area_effect_cloud,tag=gm4_new_dimension,limit=1] in minecraft:overworld run function gm4_forceload-1.0:set_marker_data

# remove temporary tags
tag @s remove gm4_in_new_dimension
tag @e[type=area_effect_cloud] remove gm4_new_dimension
