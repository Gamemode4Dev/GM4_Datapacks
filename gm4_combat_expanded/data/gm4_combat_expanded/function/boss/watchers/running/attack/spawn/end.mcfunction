# end watcher boss spawning
# @s = boss shulker
# at @s
# run from boss/watchers/running/attack/spawn/process

scoreboard players set @s gm4_ce_boss.attack_id 3
scoreboard players reset @s gm4_ce_boss.attack_progress
scoreboard players set @s gm4_ce_boss.tick_delay 15
scoreboard players set @s gm4_ce_boss.phase 1

playsound minecraft:entity.wither.spawn hostile @a[distance=..32] ~ ~ ~ 1 0.65 1
execute as @e[type=item_display,tag=gm4_ce_boss.watcher.running,tag=gm4_ce_boss.watcher.eyes] run data modify entity @s item.id set value "amethyst_block"

particle witch ~.5 ~.75 ~.35 0 0.1 0.1 0 5
particle witch ~.5 ~.75 ~-.35 0 0.1 0.1 0 5

particle witch ~-.5 ~.75 ~.35 0 0.1 0.1 0 5
particle witch ~-.5 ~.75 ~-.35 0 0.1 0.1 0 5

particle witch ~.35 ~.75 ~.5 0 0.1 0.1 0 5
particle witch ~-.35 ~.75 ~.5 0 0.1 0.1 0 5

particle witch ~.35 ~.75 ~-.5 0 0.1 0.1 0 5
particle witch ~-.35 ~.75 ~-.5 0 0.1 0.1 0 5
