# places the block state/data from the relocator item
# @s = player who placed the relocator
# located at the center of the placed relocator
# run from gm4_relocators:place_down/check_block

execute if score $facing gm4_rl_data matches 0..1 run setblock ~ ~ ~ hopper[facing=down,enabled=false]
execute if score $facing gm4_rl_data matches 2 run setblock ~ ~ ~ hopper[facing=north,enabled=false]
execute if score $facing gm4_rl_data matches 3 run setblock ~ ~ ~ hopper[facing=south,enabled=false]
execute if score $facing gm4_rl_data matches 4 run setblock ~ ~ ~ hopper[facing=east,enabled=false]
execute if score $facing gm4_rl_data matches 5 run setblock ~ ~ ~ hopper[facing=west,enabled=false]
clone ~ ~ ~ ~ ~ ~ ~ ~ ~ replace force
