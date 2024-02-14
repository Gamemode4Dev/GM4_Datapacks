
execute as @a[distance=..5.125,gamemode=!spectator,gamemode=!creative] run damage @s 12 wither by @e[type=shulker,tag=gm4_ce_boss,distance=..6,limit=1,scores={gm4_ce_boss.attack_progress=30}]

scoreboard players set @s gm4_ce_boss.attack_id 0
scoreboard players reset @s gm4_ce_boss.attack_progress
scoreboard players set @s gm4_ce_boss.tick_delay 1
