# @s = marker entity to forceload overworld
# run from load

function gm4_forceload-1.0:init_chunk
scoreboard players add #max gm4_dimension 1
scoreboard players operation @s gm4_dimension = #max gm4_dimension
tp @s 29999999 0 7135
tag @s remove gm4_new_dimension
