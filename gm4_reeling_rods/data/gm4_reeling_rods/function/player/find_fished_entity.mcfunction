# Finds entity the player fished
# @s = marker at players feet
# at @s
# with {bit_0, bit_1, bit_2, bit_3, bit_4, bit_5, bit_6, bit_7, bit_8, bit_9, bit_10, bit_11, bit_12, bit_13, bit_14, bit_15}
# run from gm4_reeling_rods:player/received_bit

$execute as @e[type=minecraft:fishing_bobber,distance=..33] \
  if function gm4_reeling_rods:player/owns_bobber \
  at @s as @e[distance=..42, limit=1, \
    tag=$(bit_0), tag=$(bit_1), tag=$(bit_2), tag=$(bit_3), tag=$(bit_4), tag=$(bit_5), tag=$(bit_6), tag=$(bit_7), \
    tag=$(bit_8), tag=$(bit_9), tag=$(bit_10), tag=$(bit_11), tag=$(bit_12), tag=$(bit_13), tag=$(bit_14), tag=$(bit_15)\
  ] at @s run function gm4_reeling_rods:fishing/select_type

# kill marker after
kill @s
