
execute if score @s gm4_aa_augment.gleaming.burning matches 1.. if score $particle_ring gm4_aa_data matches 10..20 run particle dust{color:[1.000,0.600,0.000],scale:1} ^ ^1.25 ^5 0 0 0 0 1
execute if score @s gm4_aa_augment.gleaming.frost matches 1.. if score $particle_ring gm4_aa_data matches 120..130 run particle dust{color:[0.545,0.686,0.878],scale:1} ^ ^1.25 ^5 0 0 0 0 1
execute if score @s gm4_aa_augment.gleaming.luminous matches 1.. if score $particle_ring gm4_aa_data matches 240..250 run particle dust{color:[0.580,0.627,0.380],scale:1} ^ ^1.25 ^5 0 0 0 0 1

execute if score @s gm4_aa_augment.gleaming.burning matches 1.. if score $gleaming_timer gm4_aa_data matches 1 if score $particle_ring gm4_aa_data matches 4..5 run particle dust{color:[1.000,0.600,0.000],scale:2} ^ ^1.25 ^5 0.1 0.1 0.1 0 8
execute if score @s gm4_aa_augment.gleaming.frost matches 1.. if score $gleaming_timer gm4_aa_data matches 21 if score $particle_ring gm4_aa_data matches 114..115 run particle dust{color:[0.545,0.686,0.878],scale:2} ^ ^1.25 ^5 0.1 0.1 0.1 0 8
execute if score @s gm4_aa_augment.gleaming.luminous matches 1.. if score $gleaming_timer gm4_aa_data matches 41 if score $particle_ring gm4_aa_data matches 234..235 run particle dust{color:[0.580,0.627,0.380],scale:2} ^ ^1.25 ^5 0.1 0.1 0.1 0 8

scoreboard players add $particle_ring gm4_aa_data 2
execute if score $particle_ring gm4_aa_data matches 360.. run scoreboard players remove $particle_ring gm4_aa_data 360
execute unless score $particle_ring gm4_aa_data = @s gm4_aa_augment.gleaming.particle rotated ~2 ~ run function gm4_augmented_armor:armor/augment/type/gleaming/particle_ring
