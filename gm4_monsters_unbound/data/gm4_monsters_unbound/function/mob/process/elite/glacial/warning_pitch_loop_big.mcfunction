# show warning particles
# @s = glacial elite death marker
# at @s
# run from mob/process/elite/glacial/warning_yaw_loop
# run from here

particle dust{color:[0.725,0.910,0.918],scale:2} ^ ^ ^4.8 0.02 0.02 0.02 0 1 normal
scoreboard players remove $frost_ring_pitch gm4_mu_data 5
execute if score $frost_ring_pitch gm4_mu_data matches -85.. rotated ~5 ~-5 run function gm4_monsters_unbound:mob/process/elite/glacial/warning_pitch_loop_big
