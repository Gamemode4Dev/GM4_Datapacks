# @s = player
# at @s
# run from main

execute unless score @s gm4_llp.id matches 0.. run function gm4_lively_lily_pads:player/set_id

tag @s remove gm4_llp_holding_item
execute if entity @s[gamemode=!adventure] if predicate gm4_lively_lily_pads:holding_supported_item run function gm4_lively_lily_pads:player/holding_item
