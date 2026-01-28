# Gets data for later logic
# @s = player who fished
# at @s
# run from #gm4_hooked_entity:pre_hook_on_player

data remove storage gm4_reeling_rods:temp enchanted
execute if predicate gm4_reeling_rods:holding_reeling_rod run data modify storage gm4_reeling_rods:temp enchanted.reeling set value 1
execute if predicate gm4_reeling_rods:holding_barbed_rod/level_1 run data modify storage gm4_reeling_rods:temp enchanted.barbed set value {period: 31,damage:3}
execute if predicate gm4_reeling_rods:holding_barbed_rod/level_2 run data modify storage gm4_reeling_rods:temp enchanted.barbed set value {period: 26,damage:6}
execute if predicate gm4_reeling_rods:holding_barbed_rod/level_3 run data modify storage gm4_reeling_rods:temp enchanted.barbed set value {period: 21,damage:9}
execute if predicate gm4_reeling_rods:holding_barbed_rod/level_4 run data modify storage gm4_reeling_rods:temp enchanted.barbed set value {period: 16,damage:12}
execute if predicate gm4_reeling_rods:holding_barbed_rod/level_5 run data modify storage gm4_reeling_rods:temp enchanted.barbed set value {period: 11,damage:15}
data modify storage gm4_reeling_rods:temp player_data.Pos set from entity @s Pos
execute store result score $motionX gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp player_data.Pos[0] 1
execute store result score $motionY gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp player_data.Pos[1] 1
execute store result score $motionZ gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp player_data.Pos[2] 1
