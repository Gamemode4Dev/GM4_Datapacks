
# tick down timer
scoreboard players remove @s[scores={gm4_aa_augment.gleaming.timer=1..}] gm4_aa_augment.gleaming.timer 1

# if timer reaches 0 activate damage
execute if score @s gm4_aa_augment.gleaming.timer matches 0 run return run function gm4_augmented_armor:armor/augment/type/gleaming/explode/run

# particles
particle dust{color:[1.000,1.000,1.000],scale:0.5} ^ ^0.85 ^ 0.02 0.33 0.02 0 2

scoreboard players operation $timer_percent gm4_aa_data = @s gm4_aa_augment.gleaming.timer
scoreboard players operation $timer_percent gm4_aa_data *= #100 gm4_aa_data
scoreboard players operation $timer_percent gm4_aa_data /= @s gm4_aa_augment.gleaming.timer_full

scoreboard players set $particle_ring_hide gm4_aa_data 90
scoreboard players operation $particle_ring_hide gm4_aa_data *= $timer_percent gm4_aa_data
scoreboard players operation $particle_ring_hide gm4_aa_data /= #100 gm4_aa_data

scoreboard players set $particle_ring gm4_aa_data 90
execute rotated 0 0 run function gm4_augmented_armor:armor/augment/type/gleaming/process/particle_ring
