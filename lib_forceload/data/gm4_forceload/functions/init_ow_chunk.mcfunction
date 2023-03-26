# @s = marker entity to forceload overworld
# run from load

function gm4_forceload:init_chunk
setblock 29999998 1 7131 minecraft:repeating_command_block{auto:1b,Command:"function #gm4_forceload:command_block_tick"}

scoreboard players add #max gm4_dimension 1
scoreboard players operation @s gm4_dimension = #max gm4_dimension
tp @s 29999999 0 7135
tag @s remove gm4_new_dimension
