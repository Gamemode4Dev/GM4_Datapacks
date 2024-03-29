# use this clock only when needed
# @s = unspecified
# at unspecified
# schedule from armor/modifier/type/burn/trigger_damage
# schedule from armor/modifier/type/burn/trigger_kill
# schedule from player/relog
# schedule from here

scoreboard players set $keep_tick.burn gm4_ce_keep_tick 0
execute as @a[scores={gm4_ce_burning.duration=1..}] at @s run function gm4_combat_expanded:armor/modifier/type/burn/active
execute if score $keep_tick.burn gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/burn 10t
