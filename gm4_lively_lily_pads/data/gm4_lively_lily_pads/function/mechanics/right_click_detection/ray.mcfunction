# raycasts from the players head that moves forward until it finds a lily_pad block
# @s = player holding supported item
# at @s anchored eyes, moving forward
# run from player/holding_item

execute if block ~ ~ ~ minecraft:lily_pad align xyz positioned ~.5 ~.1 ~.5 run return run function gm4_lively_lily_pads:mechanics/right_click_detection/found

# loop
scoreboard players remove $ray gm4_llp.data 1
execute if score $ray gm4_llp.data matches 0.. positioned ^ ^ ^.1 run function gm4_lively_lily_pads:mechanics/right_click_detection/ray
