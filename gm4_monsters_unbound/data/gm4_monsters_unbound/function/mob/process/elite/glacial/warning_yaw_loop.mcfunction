
scoreboard players set $frost_ring_pitch gm4_mu_data 80
execute if score $frost_ring_yaw gm4_mu_data < @s gm4_mu_data run function gm4_monsters_unbound:mob/process/elite/glacial/warning_pitch_loop_big
execute unless score $frost_ring_yaw gm4_mu_data < @s gm4_mu_data run function gm4_monsters_unbound:mob/process/elite/glacial/warning_pitch_loop_small

scoreboard players add $frost_ring_yaw gm4_mu_data 10
execute if score $frost_ring_yaw gm4_mu_data matches ..360 rotated ~10 ~ run function gm4_monsters_unbound:mob/process/elite/glacial/warning_yaw_loop
