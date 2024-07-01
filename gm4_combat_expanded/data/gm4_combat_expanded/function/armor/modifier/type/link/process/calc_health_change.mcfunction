# calculate link health change from this player
# @s = player in this link
# at unspecified
# run from armor/modifier/type/link/process/process_link

# assume health last tick was link health, see how it changed and apply to link_health
scoreboard players operation $health_change gm4_ce_data = @s gm4_ce_health.current
scoreboard players operation $health_change gm4_ce_data -= $link_health_start gm4_ce_data
scoreboard players operation $link_health gm4_ce_data += $health_change gm4_ce_data
