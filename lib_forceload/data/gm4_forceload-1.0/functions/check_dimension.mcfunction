# @s = player who changed dimensions
# run from load_wait and advancement "dimension_marking"

advancement revoke @s only gm4_forceload-1.0:dimension_marking

# spawns a dimension marker if one doesn't already exist in the dimension
execute as @e[type=area_effect_cloud,tag=gm4_dimension] at @s run function gm4_forceload-1.0:upgrade_marker
execute store success score $initialized gm4_dimension if block 29999998 1 7133 birch_wall_sign
execute if score $initialized gm4_dimension matches 0 run function gm4_forceload-1.0:mark_dimension

# remove during 1.19 update: updates chunk to include command block
execute if score $initialized gm4_dimension matches 1 unless block 29999998 1 7131 minecraft:repeating_command_block run fill 29999998 0 7130 29999998 2 7130 minecraft:bedrock
execute if score $initialized gm4_dimension matches 1 unless block 29999998 1 7131 minecraft:repeating_command_block run setblock 29999998 1 7131 minecraft:repeating_command_block{auto:1b,Command:"function #gm4:command_block_tick"}
