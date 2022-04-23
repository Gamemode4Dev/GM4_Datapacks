# @s = fill replacing armor stand
# run from self and place_down/find_head

tp @s ^ ^ ^0.01
scoreboard players add fill_counter gm4_rl_data 1
execute unless score fill_counter gm4_rl_data matches 500.. unless block ~ ~ ~ command_block{CustomName:'{"text":"Relocated Block"}'} at @s run function gm4_relocators:backwards_compatibility/place_down/find_command_block
