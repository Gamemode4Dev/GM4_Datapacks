# candle hit, need to break
# @s = player who left clicked on a candle
# at @s
# run from advancement: punch_candle_rcd

advancement revoke @s only gm4_lively_lily_pads:punch_candle_rcd

# early returns
execute if entity @s[gamemode=adventure] run return fail

# raycast
execute store result score $ray gm4_llp.data run attribute @s minecraft:block_interaction_range get 2
execute anchored eyes positioned ^ ^ ^ run function gm4_lively_lily_pads:mechanics/interactions/punch_candle/ray
