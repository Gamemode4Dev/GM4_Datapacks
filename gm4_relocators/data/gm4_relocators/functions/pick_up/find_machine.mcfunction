# @s = player who placed a relocator player head
# located at the block the head was placed on
# run from a command block placed by pick_up/replace_head

scoreboard players set valid_machine gm4_rl_data 0
execute align xyz run function #gm4_relocators:pick_up

execute unless score valid_machine gm4_rl_data matches 0 run advancement grant @s only gm4:relocators

execute if score valid_machine gm4_rl_data matches 0 run function gm4_relocators:pick_up/failed

#remove command block
summon area_effect_cloud ~ ~-5 ~ {CustomName:'"gm4_relocator_delete"',Tags:["gm4_relocator_delete"],Particle:"block air"}
scoreboard players set fill_success gm4_rl_data 0
scoreboard players set fill_counter gm4_rl_data -5
execute positioned ~ ~-5 ~ as @e[type=area_effect_cloud,tag=gm4_relocator_delete,limit=1,sort=nearest,distance=..0.01] at @s run function gm4_relocators:pick_up/delete_command_block

tag @s remove gm4_rl_placed_relocator
