
tag @a remove gm4_aa_healing_totem_target
tag @s add gm4_aa_healing_totem_target
scoreboard players operation $lowest_percentage_seen gm4_aa_data = @s gm4_sr_health.percentage
scoreboard players operation $ray_distance_target gm4_aa_data = $ray_distance gm4_aa_data
