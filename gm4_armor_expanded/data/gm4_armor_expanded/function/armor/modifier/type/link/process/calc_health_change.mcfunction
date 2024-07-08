# calculate link health change from this player
# @s = player in this link
# at unspecified
# run from armor/modifier/type/link/process/process_link

# assume health last tick was link health, see how it changed and apply to link_health
scoreboard players operation $damage_health gm4_ae_data = @s gm4_ae_health.current
scoreboard players operation $damage_health gm4_ae_data -= $link_health_start gm4_ae_data
scoreboard players operation $link_health gm4_ae_data += $damage_health gm4_ae_data
