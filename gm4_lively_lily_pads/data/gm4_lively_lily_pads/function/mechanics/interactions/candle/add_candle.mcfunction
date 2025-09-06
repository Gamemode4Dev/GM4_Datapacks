# adds candles if needed
# @s = candle block display
# at @s
# run from mechanics/interactions/candle/process_display

# fail if different candle
execute store success score $different_candle gm4_llp.data run data modify storage gm4_llp:temp held_item set from entity @s block_state.Name
execute if score $different_candle gm4_llp.data matches 1 run return fail

# fail if 4 candles already
execute if data entity @s {block_state:{Properties:{candles:"4"}}} run return 1

# set flag to remove item
scoreboard players set $placement_success gm4_llp.data 1

# sound
playsound minecraft:block.candle.place block @a[distance=..16] ~ ~ ~

# increase candle count
execute if data entity @s {block_state:{Properties:{candles:"3"}}} run data modify entity @s block_state.Properties.candles set value "4"
execute if data entity @s {block_state:{Properties:{candles:"2"}}} run data modify entity @s block_state.Properties.candles set value "3"
execute if data entity @s {block_state:{Properties:{candles:"1"}}} run data modify entity @s block_state.Properties.candles set value "2"

# update light blocks if needed
execute if entity @s[tag=gm4_llp_lit_candle] run function gm4_lively_lily_pads:mechanics/interactions/candle/update_light_blocks

return 1
