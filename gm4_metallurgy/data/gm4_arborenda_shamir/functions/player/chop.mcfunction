# Starts arborenda chopping sequence.
# @s = player that just used an axe with arborenda
# at @s
# run from gm4_arborenda:player/check_for_axe

scoreboard players set $success gm4_ml_data 0

execute as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s}] at @s run function gm4_arborenda_shamir:player/check_block_drop

scoreboard players set $chop_count gm4_ml_data -1
scoreboard players set $current_depth gm4_ml_data 0
execute if score $success gm4_ml_data matches 1 run function gm4_arborenda_shamir:trunk/next_depth

# BUG: Chop count stays at 0 if only one unconnected log is broken, therefore leaving behind markers
# these will be broken in the next chop operation, leading to unintentional griefing
execute if score $chop_count gm4_ml_data matches 1.. run function gm4_arborenda_shamir:player/modify_axe_durability
execute if score $chop_count gm4_ml_data matches 1.. run schedule function gm4_arborenda_shamir:trunk/destroy_sequenced 2t
