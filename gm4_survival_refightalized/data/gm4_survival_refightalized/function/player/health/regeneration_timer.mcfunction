
# gm4_sr_stat.regeneration_rate_change is normally 0, but can be changed by expansions
scoreboard players set $regeneration_timer gm4_sr_data 100
scoreboard players operation $regeneration_timer gm4_sr_data += @s gm4_sr_stat.regeneration_rate_change
scoreboard players operation @s gm4_sr_health.regeneration_timer -= $regeneration_timer gm4_sr_data
