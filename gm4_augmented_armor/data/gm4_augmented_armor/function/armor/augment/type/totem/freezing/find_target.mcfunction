
scoreboard players remove $attempts_left gm4_aa_data 1

# find target
scoreboard players set $ray_distance gm4_aa_data 0
execute as @n[predicate=gm4_augmented_armor:technical/pvp_able,tag=!smithed.strict,tag=!gm4_mu_frozen,tag=!gm4_mu_tried,distance=..16] facing entity @s eyes positioned ^ ^ ^0.1 run function gm4_augmented_armor:armor/augment/type/totem/freezing/los_raycast

execute if score $attempts_left gm4_aa_data matches 1.. run function gm4_augmented_armor:armor/augment/type/totem/freezing/find_target
