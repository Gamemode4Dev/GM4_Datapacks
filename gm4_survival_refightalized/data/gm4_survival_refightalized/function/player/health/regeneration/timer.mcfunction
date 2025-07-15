# process the player's regen timer
# @s = player
# at unspecified
# run from player_submain

# gm4_sr_stat.regeneration_rate_change is normally 0, but can be changed by expansions
scoreboard players set $regeneration_timer gm4_sr_data 100
scoreboard players operation $regeneration_timer gm4_sr_data += @s gm4_sr_stat.regeneration_rate_change
scoreboard players operation $regeneration_timer gm4_sr_data > #0 gm4_sr_data
scoreboard players operation @s[scores={gm4_sr_health.regeneration_timer=1..}] gm4_sr_health.regeneration_timer -= $regeneration_timer gm4_sr_data
execute unless score @s gm4_sr_health.regeneration_timer matches 1.. unless score @s gm4_sr_stat.hunger matches ..6 run function gm4_survival_refightalized:player/health/regeneration/combat_health
