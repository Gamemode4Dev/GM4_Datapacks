# Pick an order to check hand slots for stealing
# @s = #gm4_reeling_rods:steal_hand
# at bobber in @s
# run from hooked_entity/select_type

execute store result score $order gm4_reeling_rods.math run random value 1..2

execute if score $order gm4_reeling_rods.math matches 1 run return run function gm4_reeling_rods:reeling/stealable/order/hands_1
execute if score $order gm4_reeling_rods.math matches 2 run return run function gm4_reeling_rods:reeling/stealable/order/hands_2
