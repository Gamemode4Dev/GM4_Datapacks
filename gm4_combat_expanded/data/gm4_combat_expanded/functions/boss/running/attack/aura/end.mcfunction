
execute if score @s gm4_ce_boss.phase matches 1..3 as @a[distance=..5.125,gamemode=!spectator,gamemode=!creative] positioned ~-5.5 ~-1.5 ~-5.5 run damage @s[dx=10,dy=2,dz=10] 6 wither by @e[type=shulker,tag=gm4_ce_boss,distance=..12,limit=1,scores={gm4_ce_boss.attack_id=7}]
execute if score @s gm4_ce_boss.phase matches 4 as @a[distance=..5.125,gamemode=!spectator,gamemode=!creative] positioned ~-5.5 ~-1.5 ~-5.5 run damage @s[dx=10,dy=2,dz=10] 14 wither by @e[type=shulker,tag=gm4_ce_boss,distance=..12,limit=1,scores={gm4_ce_boss.attack_id=7}]

scoreboard players set @s gm4_ce_boss.attack_id 0
scoreboard players reset @s gm4_ce_boss.attack_progress
scoreboard players set @s gm4_ce_boss.tick_delay 1

execute if score @s gm4_ce_boss.phase matches 3.. run function gm4_combat_expanded:boss/running/health/immune_remove with storage gm4_combat_expanded:temp boss
