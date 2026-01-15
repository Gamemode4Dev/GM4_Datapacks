scoreboard objectives add gm4_dimension dummy
gamerule command_block_output false

execute store success score $initialized gm4_dimension if block 29999998 1 7133 birch_wall_sign
execute if score $initialized gm4_dimension matches 0 positioned ~ 0 ~ summon marker run function gm4_forceload:init_ow_chunk
