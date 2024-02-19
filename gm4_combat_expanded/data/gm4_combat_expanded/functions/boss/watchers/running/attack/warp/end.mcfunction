
tp @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.running] ~ ~ ~ 0 -90
execute as @e[tag=gm4_ce_boss.watcher.head,tag=gm4_ce_boss.running] run data merge entity @s {start_interpolation:-1,interpolation_duration:3,transformation:{scale:[0.5f,0.5f,0.5f],translation:[-0.5f,0.5f,0.4375f]}}
execute as @e[type=item_display,tag=gm4_ce_boss.watcher.head,tag=gm4_ce_boss.running] run data modify entity @s transformation.scale set from entity @s item.tag.return.scale
execute as @e[type=item_display,tag=gm4_ce_boss.watcher.head,tag=gm4_ce_boss.running] run data modify entity @s transformation.translation set from entity @s item.tag.return.translation

scoreboard players reset @s gm4_ce_boss.attack_progress
scoreboard players set @s[scores={gm4_ce_boss.phase=1..2}] gm4_ce_boss.tick_delay 50
scoreboard players set @s[scores={gm4_ce_boss.phase=3..}] gm4_ce_boss.tick_delay 10
scoreboard players set @s gm4_ce_boss.attack_id 0
