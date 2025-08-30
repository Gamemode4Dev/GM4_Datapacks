# updates light blocks
# @s = candle block display
# at @s
# run from mechanics/interactions/candle/light_candle and mechanics/interactions/candle/add_candle and mechanics/particles/candle_count

execute if block ~ ~1 ~ light run setblock ~ ~1 ~ air
execute if data entity @s {block_state:{Properties:{candles:"4"}}} run setblock ~ ~1 ~ light[level=12] keep
execute if data entity @s {block_state:{Properties:{candles:"3"}}} run setblock ~ ~1 ~ light[level=9] keep
execute if data entity @s {block_state:{Properties:{candles:"2"}}} run setblock ~ ~1 ~ light[level=6] keep
execute if data entity @s {block_state:{Properties:{candles:"1"}}} run setblock ~ ~1 ~ light[level=3] keep
