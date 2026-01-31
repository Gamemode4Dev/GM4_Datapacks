# checks candle count and redirects to correct function
# @s = candle display
# at @s
# run from mechanics/particles/select_type

# light block
function gm4_lively_lily_pads:mechanics/interactions/candle/update_light_blocks

# particles
execute store result score $rand gm4_llp.data run random value 1..4
execute if data entity @s {block_state:{Properties:{candles:"1"}}} run return run function gm4_lively_lily_pads:mechanics/particles/1_candle
execute if data entity @s {block_state:{Properties:{candles:"2"}}} run return run function gm4_lively_lily_pads:mechanics/particles/2_candle
execute if data entity @s {block_state:{Properties:{candles:"3"}}} run return run function gm4_lively_lily_pads:mechanics/particles/3_candle
function gm4_lively_lily_pads:mechanics/particles/4_candle
