# decides how to modify the candle that was interacted with
# @s = candle block display
# at @s
# run from mechanics/interactions/candle/process_interaction

# try to add candle
execute if score $holding_candle gm4_llp.data matches 1 if function gm4_lively_lily_pads:mechanics/interactions/candle/add_candle run return 1

# not holding candle try to light
execute if score $holding_lighter gm4_llp.data matches 1 if function gm4_lively_lily_pads:mechanics/interactions/candle/light_candle run return 1

# if ignition failed, but igniter was mainhand, don't extinguish
execute if score $ignited gm4_llp.data matches 0 if score $mainhand gm4_llp.data matches 1 run return fail

# try to extinguish candle
execute store result score $extinguished gm4_llp.data run data modify entity @s block_state.Properties.lit set value "false"
execute if score $extinguished gm4_llp.data matches 0 run return fail
# extinguish
tag @s remove gm4_llp_lit_candle
execute if block ~ ~1 ~ light run setblock ~ ~1 ~ air
playsound block.candle.extinguish block @a[distance=..16]
