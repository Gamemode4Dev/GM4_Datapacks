# Pick an order to check equipment slots for stealing
# @s = #gm4_reeling_rods:steal_equipment
# at bobber in @s
# run from hooked_entity/select_type & reeling/villager/action

execute store result score $order gm4_reeling_rods.math run random value 1..6

execute if score $order gm4_reeling_rods.math matches 1 run return run function gm4_reeling_rods:reeling/stealable/order/equipment_1
execute if score $order gm4_reeling_rods.math matches 2 run return run function gm4_reeling_rods:reeling/stealable/order/equipment_2
execute if score $order gm4_reeling_rods.math matches 3 run return run function gm4_reeling_rods:reeling/stealable/order/equipment_3
execute if score $order gm4_reeling_rods.math matches 4 run return run function gm4_reeling_rods:reeling/stealable/order/equipment_4
execute if score $order gm4_reeling_rods.math matches 5 run return run function gm4_reeling_rods:reeling/stealable/order/equipment_5
execute if score $order gm4_reeling_rods.math matches 6 run return run function gm4_reeling_rods:reeling/stealable/order/equipment_6
