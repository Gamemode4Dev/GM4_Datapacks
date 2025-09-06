# light candle display
# @s = candle block display
# at @s
# run from mechanics/interactions/candle/process_display

execute store success score $ignited gm4_llp.data run data modify entity @s block_state.Properties.lit set value "true"

# return if not ignited
execute if score $ignited gm4_llp.data matches 0 run return fail

# light
tag @s add gm4_llp_lit_candle
function gm4_lively_lily_pads:mechanics/interactions/candle/update_light_blocks
return 1
