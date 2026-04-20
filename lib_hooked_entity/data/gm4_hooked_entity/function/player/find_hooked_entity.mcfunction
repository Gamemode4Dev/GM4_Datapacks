# Finds the entity the player hooked
# @s = player who fished
# at @s
# with {bit_0, bit_1, bit_2, bit_3, bit_4, bit_5, bit_6, bit_7, bit_8, bit_9, bit_10, bit_11, bit_12, bit_13, bit_14, bit_15}
# run from player/received_bit

function #gm4_hooked_entity:pre_hook_on_player
tag @s add gm4_hooked_entity.player

# distance from bobber to entity is ..42 as that represents a vanilla entity of 3.28 blocks tall at a max of 16x scale and then 80% of the height to find the fishing bobber
$execute as @e[type=minecraft:fishing_bobber,distance=..33] \
  if function gm4_hooked_entity:player/owns_bobber \
  at @s as @e[\
    distance=..42, limit=1, type=!#gm4_hooked_entity:ignore, \
    scores={$(bit_0),$(bit_1),$(bit_2),$(bit_3),$(bit_4),$(bit_5),$(bit_6),$(bit_7),$(bit_8),$(bit_9),$(bit_10),$(bit_11),$(bit_12),$(bit_13),$(bit_14),$(bit_15)}\
  ] run function #gm4_hooked_entity:on_hooked_entity

tag @s remove gm4_hooked_entity.player
function #gm4_hooked_entity:post_hook_on_player
