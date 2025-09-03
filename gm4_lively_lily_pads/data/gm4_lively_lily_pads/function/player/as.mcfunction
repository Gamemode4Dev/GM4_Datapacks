# @s = player
# at @s
# run from main

tag @s remove gm4_llp_holding_item
execute if predicate gm4_lively_lily_pads:holding_placeable_item run function gm4_lively_lily_pads:player/holding_item
