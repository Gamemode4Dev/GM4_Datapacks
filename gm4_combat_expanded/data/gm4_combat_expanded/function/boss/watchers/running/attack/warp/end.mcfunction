

execute as @e[type=item_display,tag=gm4_ce_boss.watcher.head,tag=gm4_ce_boss.watcher.running] run data modify storage gm4_combat_expanded:testing store set from entity @s item

tp @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] ~ ~ ~ 0 -90
execute as @e[tag=gm4_ce_boss.watcher.head,tag=gm4_ce_boss.watcher.running] run data merge entity @s {start_interpolation:-1,interpolation_duration:3,transformation:{scale:[0.5f,0.5f,0.5f],translation:[-0.5f,0.5f,0.4375f],left_rotation:[0.0f,0.0f,0.0f,0.0f],right_rotation:[0.0f,0.0f,0.0f,0.0f]}}
execute as @e[type=item_display,tag=gm4_ce_boss.watcher.head,tag=gm4_ce_boss.watcher.running] run data modify entity @s transformation.scale set from entity @s item.components."minecraft:custom_data".gm4_combat_expanded.return.scale
execute as @e[type=item_display,tag=gm4_ce_boss.watcher.head,tag=gm4_ce_boss.watcher.running] run data modify entity @s transformation.translation set from entity @s item.components."minecraft:custom_data".gm4_combat_expanded.return.translation

scoreboard players reset @s gm4_ce_boss.attack_progress
scoreboard players set @s[scores={gm4_ce_boss.phase=1..2}] gm4_ce_boss.tick_delay 70
scoreboard players set @s[scores={gm4_ce_boss.phase=3..}] gm4_ce_boss.tick_delay 30
scoreboard players set @s gm4_ce_boss.attack_id 0
