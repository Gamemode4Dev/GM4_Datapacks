
execute if score @s gm4_ce_boss.phase matches 1..3 as @a[distance=..5.125,gamemode=!spectator,gamemode=!creative,tag=!gm4_ce_immune_wither] positioned ~-5.5 ~-2.5 ~-5.5 run damage @s[dx=10,dy=3.5,dz=10] 10 wither by @e[type=shulker,tag=gm4_ce_boss,distance=..12,limit=1,scores={gm4_ce_boss.attack_id=7}]
execute if score @s gm4_ce_boss.phase matches 4 as @a[distance=..5.125,gamemode=!spectator,gamemode=!creative,tag=!gm4_ce_immune_wither] positioned ~-5.5 ~-2.5 ~-5.5 run damage @s[dx=10,dy=3.5,dz=10] 18 wither by @e[type=shulker,tag=gm4_ce_boss,distance=..12,limit=1,scores={gm4_ce_boss.attack_id=7}]

scoreboard players set @s gm4_ce_boss.attack_id 0
scoreboard players reset @s gm4_ce_boss.attack_progress
scoreboard players set @s gm4_ce_boss.tick_delay 15
