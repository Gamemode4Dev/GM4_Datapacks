# decides how to modify the candle that was found
# @s = candle block display
# at @s
# run from mechanics/interactions/candle_rc/ray

execute if score $holding_lighter gm4_llp.data matches 1 run function gm4_lively_lily_pads:mechanics/interactions/candle_rc/light_candle
execute if score $holding_lighter gm4_llp.data matches 0 run function gm4_lively_lily_pads:mechanics/interactions/candle_rc/extinguish_candle
