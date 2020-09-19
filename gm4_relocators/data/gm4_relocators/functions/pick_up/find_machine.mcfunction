# @s = player who placed a relocator player head
# located at the block the head was placed on
# run from a command block placed by pick_up/replace_head

scoreboard players set valid_machine gm4_rl_data 0
execute align xyz run function #gm4_relocators:pick_up_check

execute unless score valid_machine gm4_rl_data matches 0 as @e[tag=gm4_rl_selected,distance=..3,limit=1] align xyz positioned ~.5 ~.5 ~.5 run function gm4_relocators:pick_up/success
execute if score valid_machine gm4_rl_data matches 0 run function gm4_relocators:pick_up/failed

#remove command block
fill ~-1 ~ ~ ~-1 ~ ~ air replace command_block[facing=east]{CustomName:'{"text":"Relocator"}'}
fill ~1 ~ ~ ~1 ~ ~ air replace command_block[facing=west]{CustomName:'{"text":"Relocator"}'}
fill ~ ~ ~-1 ~ ~ ~-1 air replace command_block[facing=south]{CustomName:'{"text":"Relocator"}'}
fill ~ ~ ~1 ~ ~ ~1 air replace command_block[facing=north]{CustomName:'{"text":"Relocator"}'}
fill ~ ~1 ~ ~ ~1 ~ air replace command_block[facing=down]{CustomName:'{"text":"Relocator"}'}
fill ~ ~-1 ~ ~ ~-1 ~ air replace command_block[facing=down]{CustomName:'{"text":"Relocator"}'}

tag @s remove gm4_rl_placed_relocator
