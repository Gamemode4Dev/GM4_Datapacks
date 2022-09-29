# Starts arborenda chopping sequence.
# @s = player that just used an axe with arborenda
# at @s
# run from gm4_arborenda:player/check_for_axe

scoreboard players set $success gm4_ml_data 0

execute as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s}] at @s run function gm4_arborenda_shamir:player/check_block_drop

# identify tree
scoreboard players set $chop_count gm4_ml_data -1
scoreboard players set $current_depth gm4_ml_data 0
execute if score $success gm4_ml_data matches 1 run function gm4_arborenda_shamir:trunk/next_depth

# chop tree and use durability
execute if score $chop_count gm4_ml_data matches 1.. run function gm4_arborenda_shamir:player/modify_axe_durability
execute if score $chop_count gm4_ml_data matches 1.. run schedule function gm4_arborenda_shamir:trunk/destroy_sequenced 2t

# kill first trunk marker (does not need to be processed by module, as it was already broken by the axe itself)
kill @e[type=marker,tag=gm4_arborenda_trunk_source]
