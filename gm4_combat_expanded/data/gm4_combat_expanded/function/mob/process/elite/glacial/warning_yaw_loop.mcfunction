
scoreboard players set $frost_ring_pitch gm4_ce_data 80
execute if score $frost_ring_yaw gm4_ce_data < @s gm4_ce_data run function gm4_combat_expanded:mob/process/elite/glacial/warning_pitch_loop_big
execute unless score $frost_ring_yaw gm4_ce_data < @s gm4_ce_data run function gm4_combat_expanded:mob/process/elite/glacial/warning_pitch_loop_small

scoreboard players add $frost_ring_yaw gm4_ce_data 10
execute if score $frost_ring_yaw gm4_ce_data matches ..360 rotated ~10 ~ run function gm4_combat_expanded:mob/process/elite/glacial/warning_yaw_loop
