# @s = command block placed by function "place_down/replace_head"

execute if score dropper gm4_rl_data matches 0 run setblock ~ ~ ~ dropper[facing=north]
execute if score hopper gm4_rl_data matches 0 run setblock ~ ~ ~ hopper[facing=south]
function gm4_relocators:place_down/place_block/base
