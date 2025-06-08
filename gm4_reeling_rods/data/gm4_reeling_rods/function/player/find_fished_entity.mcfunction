# Finds the entity the player fished
# @s = player who fished
# at @s
# with {bit_0, bit_1, bit_2, bit_3, bit_4, bit_5, bit_6, bit_7, bit_8, bit_9, bit_10, bit_11, bit_12, bit_13, bit_14, bit_15}
# run from player/received_bit

# store fishing rod & caster properties
data remove storage gm4_reeling_rods:temp enchanted
execute if predicate gm4_reeling_rods:holding_reeling_rod run data modify storage gm4_reeling_rods:temp enchanted.reeling set value 1
execute if predicate gm4_reeling_rods:holding_barbed_rod/level_1 run data modify storage gm4_reeling_rods:temp enchanted.barbed set value {damage:3}
execute if predicate gm4_reeling_rods:holding_barbed_rod/level_2 run data modify storage gm4_reeling_rods:temp enchanted.barbed set value {damage:6}
execute if predicate gm4_reeling_rods:holding_barbed_rod/level_3 run data modify storage gm4_reeling_rods:temp enchanted.barbed set value {damage:9}
execute if predicate gm4_reeling_rods:holding_barbed_rod/level_4 run data modify storage gm4_reeling_rods:temp enchanted.barbed set value {damage:12}
execute if predicate gm4_reeling_rods:holding_barbed_rod/level_5 run data modify storage gm4_reeling_rods:temp enchanted.barbed set value {damage:15}
data modify storage gm4_reeling_rods:temp player_data.Pos set from entity @s Pos
execute store result score $motionX gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp player_data.Pos[0] 1
execute store result score $motionY gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp player_data.Pos[1] 1
execute store result score $motionZ gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp player_data.Pos[2] 1

# distance from bobber to entity is ..42 as that represents a vanilla entity of 3.28 blocks tall at a max of 16x scale and then 80% of the height to find the fishing bobber
$execute as @e[type=minecraft:fishing_bobber,distance=..33] \
  if function gm4_reeling_rods:player/owns_bobber \
  at @s as @e[distance=..42, limit=1, type=!#gm4_reeling_rods:ignore, \
    tag=$(bit_0), tag=$(bit_1), tag=$(bit_2), tag=$(bit_3), tag=$(bit_4), tag=$(bit_5), tag=$(bit_6), tag=$(bit_7), \
    tag=$(bit_8), tag=$(bit_9), tag=$(bit_10), tag=$(bit_11), tag=$(bit_12), tag=$(bit_13), tag=$(bit_14), tag=$(bit_15)\
  ] unless entity @s[tag=smithed.entity] run function gm4_reeling_rods:fished/select_type
