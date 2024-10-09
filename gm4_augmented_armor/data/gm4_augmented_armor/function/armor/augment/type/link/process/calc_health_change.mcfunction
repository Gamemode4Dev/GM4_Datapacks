# calculate link health change from this player
# @s = player in this link
# at unspecified
# run from armor/augment/type/link/process/process_link

# assume health last tick was link health, see how it changed and apply to link_health
scoreboard players operation $damage_health gm4_aa_data = @s gm4_sr_stat.current_health
scoreboard players operation $damage_health gm4_aa_data -= $link_health_start gm4_aa_data
scoreboard players operation $link_health gm4_aa_data += $damage_health gm4_aa_data
