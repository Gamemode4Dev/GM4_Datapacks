# @s = command block deleting AEC
# run from self and pick_up/find_machine

execute if score fill_success gm4_rl_data matches 0 store success score fill_success gm4_rl_data run fill ~-6 ~ ~-6 ~6 ~ ~6 air replace command_block{CustomName:'{"text":"Relocator"}'}

tp @s ~ ~1 ~
scoreboard players add fill_counter gm4_rl_data 1
execute if score fill_success gm4_rl_data matches 0 unless score fill_counter gm4_rl_data matches 8.. at @s run function gm4_relocators:pick_up/delete_command_block
