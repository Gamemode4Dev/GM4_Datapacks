
# particles
particle dust{color:[0.000,0.000,0.000],scale:1} ^ ^ ^0.0125 0.2666 0.2666 0.2666 0.666 4 normal

scoreboard players add @s gm4_mu_timer 1

# track towards closest player
execute facing entity @p[gamemode=!spectator] eyes positioned ^ ^ ^25 rotated as @s positioned ^ ^ ^25 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~
tp @s[scores={gm4_mu_timer=30..60}] ^ ^ ^0.075
tp @s[scores={gm4_mu_timer=61..90}] ^ ^ ^0.125
tp @s[scores={gm4_mu_timer=91..120}] ^ ^ ^0.200
tp @s[scores={gm4_mu_timer=121..140}] ^ ^ ^0.300
tp @s[scores={gm4_mu_timer=141..160}] ^ ^ ^0.450
tp @s[scores={gm4_mu_timer=161..}] ^ ^ ^0.650

# hit players
scoreboard players set $player_hit gm4_mu_data 0
execute if score @s gm4_mu_timer matches 40.. positioned ~-.15 ~-.15 ~-.15 as @a[dx=0,dy=0,dz=0] positioned ~-0.55 ~-0.55 ~-0.55 if entity @s[dx=0,dy=0,dz=0] run function gm4_monsters_unbound:mob/process/elite/vorpal/fear_hit
execute if score $player_hit gm4_mu_data matches 1 run return run kill @s

# timer ran out
execute if score @s gm4_mu_timer matches 240.. run return run kill @s

# keep running if entity is still around
scoreboard players set $keep_tick.elite_death_vorpal gm4_mu_keep_tick 1
