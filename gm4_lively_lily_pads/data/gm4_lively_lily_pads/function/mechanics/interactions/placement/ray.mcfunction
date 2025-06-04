# raycasts from the players head that moves forward until it finds a lily_pad block with a rcd
# @s = player holding supported item, interacted with rcd
# at @s anchored eyes, moving forward
# run from mechanics/interactions/placement/interact_right_click_detection

# as used as an if
execute if block ~ ~ ~ minecraft:lily_pad align xyz positioned ~.5 ~.1 ~.5 \
  as @e[type=minecraft:interaction,tag=gm4_llp_placement_rcd,limit=1,distance=..0.1] \
  run return run function gm4_lively_lily_pads:mechanics/interactions/placement/found

# loop
scoreboard players remove $ray gm4_llp.data 1
execute if score $ray gm4_llp.data matches 0.. positioned ^ ^ ^.1 run function gm4_lively_lily_pads:mechanics/interactions/placement/ray
