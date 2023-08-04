# @s = marker entity to forceload overworld
# run from load

function gm4_forceload:init_chunk
setblock 29999998 1 7131 minecraft:repeating_command_block{auto:1b,Command:"function #gm4_forceload:command_block_tick"}
summon armor_stand 29999999 0 7135 {UUID:[I;3427655,262148,262159,80613453],Invulnerable:1,Invisible:1,Marker:1,Tags:["smithed.entity","smithed.strict"],CustomName:'"lib_forceload_armorstand"'}
#alias uuid lib_forceload_armorstand 344d47-4-4-4-f04ce104d

scoreboard players add #max gm4_dimension 1
scoreboard players operation @s gm4_dimension = #max gm4_dimension
tp @s 29999999 0 7135
tag @s remove gm4_new_dimension
