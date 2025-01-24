
scoreboard players remove $particle_ring gm4_aa_data 1

particle dust{color:[0.851,0.753,0.263],scale:1} ^ ^ ^0.5 0.01 0.01 0.01 1 1 normal
execute if predicate {condition:"random_chance",chance:0.5} run particle dust{color:[0.851,0.753,0.263],scale:1} ^ ^ ^1 0.01 0.01 0.01 1 1 normal
execute if predicate {condition:"random_chance",chance:0.33} run particle dust{color:[0.851,0.753,0.263],scale:1} ^ ^ ^1.75 0.01 0.01 0.01 1 1 normal

# continue raycast
execute if score $particle_ring gm4_aa_data matches 1.. rotated ~2 ~ run function gm4_augmented_armor:armor/augment/type/totemic/haste/particle_ring
