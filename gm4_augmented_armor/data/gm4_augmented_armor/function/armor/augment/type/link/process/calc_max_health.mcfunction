
# calculate average max health between all players in this link
scoreboard players set $link_max_health gm4_aa_data 0
execute as @a[tag=gm4_aa_link.process] run scoreboard players operation $link_max_health gm4_aa_data += @s gm4_aa_link_max_health
execute store result storage gm4_augmented_armor:temp run_links[0].max_health int 1 run scoreboard players operation $link_max_health gm4_aa_data /= $link_players gm4_aa_data

# translate this health to players
execute as @a[tag=gm4_aa_link.process] run function gm4_augmented_armor:armor/augment/type/link/process/calc_max_health_change
