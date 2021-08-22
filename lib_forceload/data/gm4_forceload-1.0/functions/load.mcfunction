scoreboard objectives add gm4_dimension dummy

execute store success score $initialized gm4_dimension if block 29999998 1 7133 birch_wall_sign
execute if score $initialized gm4_dimension matches 0 run summon marker ~ 0 ~ {CustomName:'"minecraft:overworld"',Tags:["gm4_dimension","gm4_new_dimension"]}
execute if score $initialized gm4_dimension matches 0 as @e[type=marker,tag=gm4_new_dimension,limit=1] run function gm4_forceload-1.0:init_ow_chunk
function gm4_forceload-1.0:load_wait
