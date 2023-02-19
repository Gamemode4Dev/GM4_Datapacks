# finds the box the player placed
# @s = player who placed a hotswapper
# at @s
# run from advancement "gm4_hotswap_hotbars:placed_hotswapper"

advancement revoke @s only gm4_hotswap_hotbars:placed_hotswapper

# get item data to verify the correct box gets found
data modify storage gm4_hotswap_hotbars:temp item_data set from entity @s SelectedItem.tag

# raycast
scoreboard players set $ray gm4_hh_data 50
scoreboard players set $found gm4_hh_data 0
execute anchored eyes positioned ^ ^ ^ run function gm4_hotswap_hotbars:place_hotswapper/ray

# fuzzy raycast
scoreboard players set $ray gm4_hh_data 50
execute if score $found gm4_hh_data matches 0 anchored eyes positioned ^ ^ ^ run function gm4_hotswap_hotbars:place_hotswapper/ray_fuzzy

# clean up
data remove storage gm4_hotswap_hotbars:temp item_data
data remove storage gm4_hotswap_hotbars:temp check
