# string manipulation and data transfer from legacy candles
# @s = block display, tag=lilyPadLight
# at @s align xyz positioned ~.5 ~.02 ~.5
# with {str_len}
# run from upgrade_paths/3.0/update_legacy_display

# string manipulation for candle_type, step 2
$data modify storage gm4_llp:temp candle_type set string storage gm4_llp:temp DisplayType 10 $(str_len)
# now we can summon new display
function gm4_lively_lily_pads:mechanics/interactions/placement/candles with storage gm4_llp:temp

# set additional data from old display
data modify entity @e[type=minecraft:block_display,tag=gm4_llp_generic_candle,limit=1,distance=..0.1] block_state.Properties.candles \
  set from entity @s block_state.Properties.candles
data modify entity @e[type=minecraft:block_display,tag=gm4_llp_generic_candle,limit=1,distance=..0.1] block_state.Properties.lit \
  set from entity @s block_state.Properties.lit
execute if data entity @s {block_state:{Properties:{lit:"true"}}} \
  run tag @e[type=minecraft:block_display,tag=gm4_llp_generic_candle,limit=1,distance=..0.1] add gm4_llp_lit_candle
