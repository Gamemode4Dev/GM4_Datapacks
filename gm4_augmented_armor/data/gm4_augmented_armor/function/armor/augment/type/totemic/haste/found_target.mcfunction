
scoreboard players set $target_affected gm4_aa_data 1
scoreboard players set $ray_distance gm4_aa_data 0

tag @s add gm4_aa_totem_hasted
attribute @s attack_speed modifier add gm4_augmented_armor:haste_totem 0.2 add_multiplied_total
attribute @s movement_speed modifier add gm4_augmented_armor:haste_totem 0.2 add_multiplied_total
attribute @s block_break_speed modifier add gm4_augmented_armor:haste_totem 0.2 add_multiplied_total
