# raycasts from the players head that moves forward until it finds a lily_pad block with the right rcd
# @s = player who wants to add a candle
# at @s anchored eyes, moving forward
# with {string}
# run from mechanincs/interactions/add_candle/ray_init & self

# as used as an if
$execute if block ~ ~ ~ minecraft:lily_pad align xyz positioned ~.5 ~.02 ~.5 \
  as @e[type=minecraft:block_display,tag=gm4_llp_$(string),limit=1,distance=..0.1] \
  run return run function gm4_lively_lily_pads:mechanics/interactions/add_candle/modify

# loop
scoreboard players remove $ray gm4_llp.data 1
execute if score $ray gm4_llp.data matches 0.. positioned ^ ^ ^.5 run function gm4_lively_lily_pads:mechanics/interactions/add_candle/ray with storage gm4_llp:temp
