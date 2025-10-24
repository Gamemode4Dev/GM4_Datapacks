# raycasts from the players head that moves forward until it finds a lily_pad block
# @s = player holding supported item
# at @s anchored eyes, moving forward
# run from player/holding_item and self

# Vertical Offset   =   1 - Detection Height
execute if block ~ ~.5 ~ minecraft:lily_pad if block ~ ~ ~ minecraft:lily_pad align xyz \
  unless entity @e[type=minecraft:block_display,limit=1,dx=0,tag=gm4_llp_display] \
  run return run function gm4_lively_lily_pads:mechanics/right_click_detection/found

# loop
scoreboard players remove $ray gm4_llp.data 1
execute if score $ray gm4_llp.data matches 0.. positioned ^ ^ ^.5 run function gm4_lively_lily_pads:mechanics/right_click_detection/ray
# Raycast Step    =   Detection Height
