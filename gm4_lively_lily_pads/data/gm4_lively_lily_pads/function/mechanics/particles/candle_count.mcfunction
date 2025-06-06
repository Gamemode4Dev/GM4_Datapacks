# checks candle count and redirects to correct function
# @s = candle display
# at @s
# run from tick

execute if data entity @s {block_state:{Properties:{candles:"1"}}} run return run particle small_flame ~ ~.42 ~
execute if data entity @s {block_state:{Properties:{candles:"2"}}} run return run function gm4_lively_lily_pads:mechanics/particles/2_candle
execute if data entity @s {block_state:{Properties:{candles:"3"}}} run return run function gm4_lively_lily_pads:mechanics/particles/3_candle
function gm4_lively_lily_pads:mechanics/particles/4_candle
