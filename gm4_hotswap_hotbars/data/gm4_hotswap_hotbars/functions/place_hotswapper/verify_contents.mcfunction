# check that the box contents match the item data
# @s = player that placed a hotswapper
# at @s anchored eyes positioned ^ ^ ^0.X where X = step count (at a shulker box in front of the player)
# run from gm4_hotswap_hotbars:place_hotswapper/ray
# and from gm4_hotswap_hotbars:place_hotswapper/ray_fuzzy

# check data
data modify storage gm4_hotswap_hotbars:temp check set from block ~ ~ ~ Items
execute store success score $different gm4_hh_data run data modify storage gm4_hotswap_hotbars:temp check set from storage gm4_hotswap_hotbars:temp item_data.BlockEntityTag.Items
data remove storage gm4_hotswap_hotbars:temp check

# mark box as hotswapper
execute if score $different gm4_hh_data matches 0 run function gm4_hotswap_hotbars:place_hotswapper/mark_hotswapper
execute if score $different gm4_hh_data matches 1 if score $no_items gm4_hh_data matches 1 unless data block ~ ~ ~ Items run function gm4_hotswap_hotbars:place_hotswapper/mark_hotswapper
