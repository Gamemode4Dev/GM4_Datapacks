# handles candle flame particles

schedule function gm4_lively_lily_pads:tick 5t

execute as @e[type=block_display,tag=gm4_llp_lit_candle] at @s run function gm4_lively_lily_pads:mechanics/particles/candle_count
