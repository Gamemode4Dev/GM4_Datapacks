# @s = player holding supported item
# at @s
# run from player/as

# tag
tag @s add gm4_llp_holding_item

# raycast for lily_pad
execute store result score $ray gm4_llp.data run attribute @s minecraft:block_interaction_range get 2
execute anchored eyes positioned ^ ^ ^ run function gm4_lively_lily_pads:mechanics/right_click_detection/ray
