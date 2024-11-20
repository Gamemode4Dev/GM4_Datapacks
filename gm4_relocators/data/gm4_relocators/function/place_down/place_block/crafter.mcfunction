# places the block state/data from the relocator item
# @s = player who placed the relocator
# located at the center of the placed relocator
# run from gm4_relocators:place_down/check_block

execute if score $facing gm4_rl_data matches 0 run setblock ~ ~ ~ crafter[orientation=up_north]
execute if score $facing gm4_rl_data matches 1 run setblock ~ ~ ~ crafter[orientation=up_south]
execute if score $facing gm4_rl_data matches 2 run setblock ~ ~ ~ crafter[orientation=up_east]
execute if score $facing gm4_rl_data matches 3 run setblock ~ ~ ~ crafter[orientation=up_west]
execute if score $facing gm4_rl_data matches 4 run setblock ~ ~ ~ crafter[orientation=down_north]
execute if score $facing gm4_rl_data matches 5 run setblock ~ ~ ~ crafter[orientation=down_south]
execute if score $facing gm4_rl_data matches 6 run setblock ~ ~ ~ crafter[orientation=down_east]
execute if score $facing gm4_rl_data matches 7 run setblock ~ ~ ~ crafter[orientation=down_west]
execute if score $facing gm4_rl_data matches 8 run setblock ~ ~ ~ crafter[orientation=north_up]
execute if score $facing gm4_rl_data matches 9 run setblock ~ ~ ~ crafter[orientation=south_up]
execute if score $facing gm4_rl_data matches 10 run setblock ~ ~ ~ crafter[orientation=east_up]
execute if score $facing gm4_rl_data matches 11 run setblock ~ ~ ~ crafter[orientation=west_up]
