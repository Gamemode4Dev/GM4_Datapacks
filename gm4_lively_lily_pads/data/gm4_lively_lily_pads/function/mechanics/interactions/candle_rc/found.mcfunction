# decides how to modify the candle that was found
# @s = candle block display
# at @s
# run from mechanics/interactions/candle_rc/ray

execute if score $holding_lighter gm4_llp.data matches 1 run return run function gm4_lively_lily_pads:mechanics/interactions/candle_rc/light_candle

## not holding lighter, extinguish candle
execute store result score $extinguished gm4_llp.data run data modify entity @s block_state.Properties.lit set value "false"

# return if no change
execute if score $extinguished gm4_llp.data matches 0 run return fail

# extinguish
tag @s remove gm4_llp_lit_candle
execute if block ~ ~1 ~ light run setblock ~ ~1 ~ air
