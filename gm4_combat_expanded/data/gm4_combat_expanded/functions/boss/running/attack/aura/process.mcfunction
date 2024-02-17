
scoreboard players add @s gm4_ce_boss.attack_progress 1
scoreboard players set @s gm4_ce_boss.tick_delay 2

execute if score @s[scores={gm4_ce_boss.phase=3..}] gm4_ce_boss.attack_progress matches 2 run function gm4_combat_expanded:boss/running/health/immune_add with storage gm4_combat_expanded:temp boss

execute if score @s gm4_ce_boss.attack_progress matches 1 run playsound minecraft:entity.evoker.prepare_attack hostile @a[distance=..16] ~ ~ ~ 1.25 0.65 1
scoreboard players set @s[scores={gm4_ce_boss.phase=4,gm4_ce_boss.attack_progress=2}] gm4_ce_boss.attack_progress 14

scoreboard players set $particle_ring gm4_ce_boss 90
function gm4_combat_expanded:boss/running/attack/aura/particle_ring

execute if score @s gm4_ce_boss.attack_progress matches 1 run tp @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] ~ ~ ~ 0 0
execute if score @s gm4_ce_boss.attack_progress matches 1..23 as @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] at @s run tp @s ~ ~ ~ ~30 ~
execute if score @s gm4_ce_boss.attack_progress matches 24.. as @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] at @s run tp @s ~ ~ ~ ~75 ~

execute if score @s gm4_ce_boss.attack_progress matches 3..58 as @a[distance=..5.125,gamemode=!spectator,gamemode=!creative] positioned ~-5.5 ~-1.5 ~-5.5 run effect give @s[dx=10,dy=2,dz=10] darkness 2 0
execute if score @s gm4_ce_boss.attack_progress matches 3..24 at @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] run particle smoke ^ ^ ^0.3 0.15 0.15 0.15 0.05 8
execute if score @s gm4_ce_boss.attack_progress matches 25..60 at @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] run particle smoke ^ ^ ^0.35 0.2 0.2 0.2 0.15 16

execute if score @s gm4_ce_boss.attack_progress matches 25..34 as @a[distance=..5.125,gamemode=!spectator,gamemode=!creative,tag=!gm4_ce_immune_wither] positioned ~-5.5 ~-1.5 ~-5.5 run effect give @s[dx=10,dy=2,dz=10] wither 4 0
execute if score @s gm4_ce_boss.attack_progress matches 35..44 as @a[distance=..5.125,gamemode=!spectator,gamemode=!creative,tag=!gm4_ce_immune_wither] positioned ~-5.5 ~-1.5 ~-5.5 run effect give @s[dx=10,dy=2,dz=10] wither 6 1
execute if score @s gm4_ce_boss.attack_progress matches 45..59 as @a[distance=..5.125,gamemode=!spectator,gamemode=!creative,tag=!gm4_ce_immune_wither] positioned ~-5.5 ~-1.5 ~-5.5 run effect give @s[dx=10,dy=2,dz=10] wither 8 2

execute if score @s gm4_ce_boss.attack_progress matches 60 run function gm4_combat_expanded:boss/running/attack/aura/end
