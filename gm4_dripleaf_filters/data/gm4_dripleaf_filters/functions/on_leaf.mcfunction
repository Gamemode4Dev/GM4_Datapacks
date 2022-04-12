# Determine leaf orientation and look for a hopper with items in front of the leaf
# @s an item on a big dripleaf
# at @s aligned xz
# run from gm4_dripleaf_filters:main

# determine leaf orientation
execute if block ~ ~ ~ big_dripleaf[facing=south] run teleport @s ~ ~ ~ 0 0
execute if block ~ ~ ~ big_dripleaf[facing=west] run teleport @s ~ ~ ~ 90 0
execute if block ~ ~ ~ big_dripleaf[facing=north] run teleport @s ~ ~ ~ 180 0
execute if block ~ ~ ~ big_dripleaf[facing=east] run teleport @s ~ ~ ~ -90 0

#if the hopper has items in it, check if any of the items match this one
execute at @s if block ^ ^-1 ^1 hopper{Items:[{}]} run function gm4_dripleaf_filters:check_hopper_filter
