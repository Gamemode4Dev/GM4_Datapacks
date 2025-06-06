# modify candle to light it
# @s = candle block display
# at @s
# run from mechanics/interactions/light_candle/ray

execute store result score $ignited gm4_llp.data run data modify entity @s block_state.Properties.lit set value "true"
tag @s add gm4_llp_lit_candle

# return if not ignited
execute if score $ignited gm4_llp.data matches 0 run return fail

function gm4_lively_lily_pads:mechanics/interactions/light_candle/update_light_blocks
