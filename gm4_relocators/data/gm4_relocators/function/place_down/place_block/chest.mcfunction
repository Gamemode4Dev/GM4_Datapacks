# places the block state/data from the relocator item
# @s = player who placed the relocator
# located at the center of the placed relocator
# run from gm4_relocators:place_down/check_block

execute if score $facing gm4_rl_data matches 0..2 run setblock ~ ~ ~ chest[facing=north]
execute if score $facing gm4_rl_data matches 3 run setblock ~ ~ ~ chest[facing=south]
execute if score $facing gm4_rl_data matches 4 run setblock ~ ~ ~ chest[facing=east]
execute if score $facing gm4_rl_data matches 5 run setblock ~ ~ ~ chest[facing=west]

execute if score $facing gm4_rl_data matches 0..2 if score $waterlogged gm4_rl_data matches 1 run setblock ~ ~ ~ chest[facing=north,waterlogged=true]
execute if score $facing gm4_rl_data matches 3 if score $waterlogged gm4_rl_data matches 1 run setblock ~ ~ ~ chest[facing=south,waterlogged=true]
execute if score $facing gm4_rl_data matches 4 if score $waterlogged gm4_rl_data matches 1 run setblock ~ ~ ~ chest[facing=east,waterlogged=true]
execute if score $facing gm4_rl_data matches 5 if score $waterlogged gm4_rl_data matches 1 run setblock ~ ~ ~ chest[facing=west,waterlogged=true]
