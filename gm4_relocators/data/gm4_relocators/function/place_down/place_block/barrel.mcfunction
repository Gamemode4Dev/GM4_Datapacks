# places the block state/data from the relocator item
# @s = player who placed the relocator
# located at the center of the placed relocator
# run from gm4_relocators:place_down/check_block

execute if score $facing gm4_rl_data matches 0 run setblock ~ ~ ~ barrel[facing=up]
execute if score $facing gm4_rl_data matches 1 run setblock ~ ~ ~ barrel[facing=down]
execute if score $facing gm4_rl_data matches 2 run setblock ~ ~ ~ barrel[facing=north]
execute if score $facing gm4_rl_data matches 3 run setblock ~ ~ ~ barrel[facing=south]
execute if score $facing gm4_rl_data matches 4 run setblock ~ ~ ~ barrel[facing=east]
execute if score $facing gm4_rl_data matches 5 run setblock ~ ~ ~ barrel[facing=west]
