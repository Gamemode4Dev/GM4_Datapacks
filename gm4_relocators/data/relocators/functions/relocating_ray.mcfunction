# @s = area effect cloud ray used to detect the machine block
# run from either check_machine_block or check_machine_block_wall

scoreboard players add gm4_ray_counter gm4_rl_data 1
tp @s ^ ^ ^0.01
execute if score gm4_ray_counter gm4_rl_data matches 0..500 at @s unless block ~ ~ ~ player_head{Owner:{Id:"2c0fa9da-b8e7-4dfe-81eb-7885c62d6a92"}} unless block ~ ~ ~ player_wall_head{Owner:{Id:"2c0fa9da-b8e7-4dfe-81eb-7885c62d6a92"}} run function relocators:relocating_ray
