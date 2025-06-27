# extinguishes candle
# @s = candle block display
# at @s
# run from mechanics/interactions/candle_rc/found

execute store result score $extinguished gm4_llp.data run data modify entity @s block_state.Properties.lit set value "false"

# return if not extinguished
execute if score $extinguished gm4_llp.data matches 0 run return fail

# extinguish
tag @s remove gm4_llp_lit_candle
execute if block ~ ~1 ~ light run setblock ~ ~1 ~ air
