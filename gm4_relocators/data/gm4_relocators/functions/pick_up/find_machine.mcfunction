# @s = player who placed a relocator player head
# located at the block the head was placed on
# run from a command block placed by pick_up/replace_head

scoreboard players set valid_machine gm4_rl_data 0
execute align xyz run function #gm4_relocators:pick_up

execute unless score valid_machine gm4_rl_data matches 0 run advancement grant @s only gm4:relocators

execute if score valid_machine gm4_rl_data matches 0 run function gm4_relocators:pick_up/failed

execute at @s run fill ~-6 ~-5 ~-6 ~6 ~7 ~6 air replace command_block{CustomName:'{"text":"Relocator"}'}

tag @s remove gm4_rl_placed_relocator
