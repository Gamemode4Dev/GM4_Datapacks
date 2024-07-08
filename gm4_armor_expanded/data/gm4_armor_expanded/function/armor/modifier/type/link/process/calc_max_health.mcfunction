
# calculate average max health between all players in this link
scoreboard players set $link_max_health gm4_ae_data 0
execute as @a[tag=gm4_ae_link.process] run scoreboard players operation $link_max_health gm4_ae_data += @s gm4_ae_link_max_health
execute store result storage gm4_armor_expanded:temp run_links[0].max_health int 1 run scoreboard players operation $link_max_health gm4_ae_data /= $link_players gm4_ae_data

# translate this health to players
execute as @a[tag=gm4_ae_link.process] run function gm4_armor_expanded:armor/modifier/type/link/process/calc_max_health_change
