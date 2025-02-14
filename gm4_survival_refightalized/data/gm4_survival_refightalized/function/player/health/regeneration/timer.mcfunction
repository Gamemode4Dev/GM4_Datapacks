# process the player's combat regen timer
# @s = player
# at @s
# run from player_submain

# get the base regeneration rate at the players location
scoreboard players set @s gm4_sr_stat.regeneration_rate_base 100
execute if predicate gm4_survival_refightalized:technical/sunlight positioned over motion_blocking_no_leaves positioned ~-.5 ~ ~-.5 if entity @s[dx=0,dy=500,dz=0] run scoreboard players set @s gm4_sr_stat.regeneration_rate_base 200
execute if predicate {condition:"minecraft:location_check",predicate:{light:{light:0}}} run scoreboard players set @s gm4_sr_stat.regeneration_rate_base 50

# gm4_sr_stat.regeneration_rate_change is normally 0, but can be changed by expansions
scoreboard players operation $regeneration_timer gm4_sr_data = @s gm4_sr_stat.regeneration_rate_base
scoreboard players operation $regeneration_timer gm4_sr_data += @s gm4_sr_stat.regeneration_rate_change
scoreboard players operation $regeneration_timer gm4_sr_data > #0 gm4_sr_data
scoreboard players operation @s gm4_sr_health.regeneration_timer -= $regeneration_timer gm4_sr_data
