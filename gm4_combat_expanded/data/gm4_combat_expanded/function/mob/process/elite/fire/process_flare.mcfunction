
# particles
particle flame ^ ^ ^0.0125 0.12 0.12 0.12 0.015 2

# move towards closest player, tracking is better at first, then stops before it explodes
execute if score @s gm4_ce_timer matches ..30 facing entity @p[gamemode=!spectator] eyes positioned ^ ^ ^50 rotated as @s positioned ^ ^ ^200 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~ 
execute if score @s gm4_ce_timer matches 31..150 facing entity @p[gamemode=!spectator] eyes positioned ^ ^ ^50 rotated as @s positioned ^ ^ ^500 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~ 
tp @s ^ ^ ^0.35

scoreboard players set $flare_hit gm4_ce_data 0
# hit players
execute positioned ~-.15 ~-.15 ~-.15 as @a[dx=0,dy=0,dz=0] positioned ~-0.55 ~-0.55 ~-0.55 if entity @s[dx=0,dy=0,dz=0] run scoreboard players set $flare_hit gm4_ce_data 1
# hit terrain
execute unless block ~ ~ ~ #gm4:no_collision run scoreboard players set $flare_hit gm4_ce_data 1
# timer ran out
scoreboard players add @s gm4_ce_timer 1
execute if score @s gm4_ce_timer matches 180.. run scoreboard players set $flare_hit gm4_ce_data 1
# explode when something is hit
execute if score $flare_hit gm4_ce_data matches 1 run return run function gm4_combat_expanded:mob/process/elite/fire/explode_flare

# keep running
scoreboard players set $keep_tick.elite_process_flare gm4_ce_keep_tick 1
