# @s = player that just used an axe with arborenda
# run from chop and next_depth

execute as @e[type=marker,tag=gm4_arborenda_init] at @s run function gm4_arborenda_shamir:mark_neighbors

# finish the new trunk markers
execute store result score @e[type=marker,tag=gm4_arborenda_init] gm4_arb_depth run scoreboard players add current_depth gm4_ml_data 1
execute if score current_depth gm4_ml_data matches ..32 if score chop_count gm4_ml_data matches ..256 if entity @e[type=marker,tag=gm4_arborenda_init] run function gm4_arborenda_shamir:next_depth
