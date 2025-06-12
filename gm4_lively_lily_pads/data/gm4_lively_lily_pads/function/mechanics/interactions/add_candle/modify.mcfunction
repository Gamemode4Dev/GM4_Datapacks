# adds candles if needed
# @s = candle block display
# at @s
# run from mechanics/interactions/add_candle/ray

execute if data entity @s {block_state:{Properties:{candles:"4"}}} run return fail

scoreboard players set $minus_one gm4_llp.data 1

# sound
playsound minecraft:block.candle.place block @a[distance=..16] ~ ~ ~

# data modify
execute if data entity @s {block_state:{Properties:{candles:"3"}}} run data modify entity @s block_state.Properties.candles set value "4"
execute if data entity @s {block_state:{Properties:{candles:"2"}}} run data modify entity @s block_state.Properties.candles set value "3"
execute if data entity @s {block_state:{Properties:{candles:"1"}}} run data modify entity @s block_state.Properties.candles set value "2"

# update light blocks if needed
execute if entity @s[tag=gm4_llp_lit_candle] run function gm4_lively_lily_pads:mechanics/interactions/candle_rc/update_light_blocks
