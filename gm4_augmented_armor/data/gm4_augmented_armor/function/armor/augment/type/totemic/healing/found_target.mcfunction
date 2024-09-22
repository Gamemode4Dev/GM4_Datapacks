
function gm4_survival_refightalized:player/health/calculate_hp
execute if score @s gm4_sr_health.percentage < $lowest_percentage_seen gm4_aa_data run function gm4_augmented_armor:armor/augment/type/totemic/healing/set_target
scoreboard players set $ray_distance gm4_aa_data 0
