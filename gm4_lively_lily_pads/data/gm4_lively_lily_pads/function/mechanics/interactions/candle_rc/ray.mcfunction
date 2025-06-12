# raycasts from the players head that moves forward until it finds a lily_pad block with the right rcd
# @s = player who wants to add a candle
# at @s anchored eyes, moving forward
# run from mechanincs/interactions/candle_rc/ray_init  and  self

# as used as an if
execute if block ~ ~ ~ minecraft:lily_pad align xyz positioned ~.5 ~.02 ~.5 \
  as @e[type=minecraft:block_display,tag=gm4_llp_generic_candle,limit=1,distance=..0.1] \
  run return run function gm4_lively_lily_pads:mechanics/interactions/candle_rc/found

# loop
scoreboard players remove $ray gm4_llp.data 1
execute if score $ray gm4_llp.data matches 0.. positioned ^ ^ ^.1 run function gm4_lively_lily_pads:mechanics/interactions/candle_rc/ray
