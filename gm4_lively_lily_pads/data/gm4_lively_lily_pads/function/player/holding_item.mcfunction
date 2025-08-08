# @s = player holding supported item
# at @s
# run from player/as

tag @s add gm4_llp_holding_item

# raycast for lily_pad
# | 6 blocks, 0.5 forward at a time
scoreboard players set $ray gm4_llp.data 12
execute anchored eyes positioned ^ ^ ^ run function gm4_lively_lily_pads:mechanics/right_click_detection/ray
