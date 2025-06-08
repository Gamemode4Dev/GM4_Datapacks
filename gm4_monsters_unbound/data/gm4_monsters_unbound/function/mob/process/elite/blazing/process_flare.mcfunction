# process the flare
# @s = flare block_display
# at @s
# run from clocks/elite/blazing_flare

# particles
particle flame ^ ^ ^0.0125 0.12 0.12 0.12 0.015 2

# track towards closest player until nearby, then fly off
execute if score @s gm4_mu_data matches 0 positioned ^ ^ ^0.7 if entity @p[gamemode=!spectator,gamemode=!creative,distance=..2] run scoreboard players set @s gm4_mu_data 1
execute if score @s[scores={gm4_mu_data=0}] gm4_mu_timer matches ..60 facing entity @p[gamemode=!spectator,gamemode=!creative] eyes positioned ^ ^ ^50 rotated as @s positioned ^ ^ ^500 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~ 
tp @s[scores={gm4_mu_timer=..10}] ^ ^ ^0.35
tp @s[scores={gm4_mu_timer=11..60}] ^ ^ ^0.25
tp @s[scores={gm4_mu_timer=61..70}] ^ ^ ^0.15
tp @s[scores={gm4_mu_timer=71..}] ^ ^ ^0.05

scoreboard players set $flare_hit gm4_mu_data 0
# hit players
execute positioned ~-.15 ~-.15 ~-.15 as @a[dx=0,dy=0,dz=0] positioned ~-0.55 ~-0.55 ~-0.55 if entity @s[dx=0,dy=0,dz=0] run scoreboard players set $flare_hit gm4_mu_data 1
# hit terrain
execute unless block ~ ~ ~ #gm4:no_collision run scoreboard players set $flare_hit gm4_mu_data 1
# timer ran out
scoreboard players add @s gm4_mu_timer 1
execute if score @s gm4_mu_timer matches 80.. run scoreboard players set $flare_hit gm4_mu_data 1
# explode when something is hit
execute if score $flare_hit gm4_mu_data matches 1 run return run function gm4_monsters_unbound:mob/process/elite/blazing/flare_explode

# keep running
scoreboard players set $keep_tick.elite_process_flare gm4_mu_keep_tick 1
