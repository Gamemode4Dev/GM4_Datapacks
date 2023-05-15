scoreboard objectives add gm4_dimension dummy
gamerule commandBlockOutput false

execute store success score $initialized gm4_dimension if block 29999998 1 7133 birch_wall_sign
execute if score $initialized gm4_dimension matches 0 run summon marker ~ 0 ~ {CustomName:'"minecraft:overworld"',Tags:["gm4_dimension","gm4_new_dimension"]}
execute if score $initialized gm4_dimension matches 0 as @e[type=marker,tag=gm4_new_dimension,limit=1] run function gm4_forceload:init_ow_chunk
function gm4_forceload:load_wait

# remove this after 1.19: places repeating command block in overworld
execute if score $initialized gm4_dimension matches 1 unless block 29999998 1 7131 minecraft:repeating_command_block run fill 29999998 0 7130 29999997 2 7130 minecraft:bedrock
execute if score $initialized gm4_dimension matches 1 unless block 29999998 1 7131 minecraft:repeating_command_block run setblock 29999998 1 7131 minecraft:repeating_command_block{auto:1b,Command:"function #gm4_forceload:command_block_tick"}
