
execute as @e[tag=gm4_ce_boss.watcher.head,tag=gm4_ce_boss.watcher.running] run data merge entity @s {start_interpolation:-1,interpolation_duration:5,transformation:{scale:[0.0f,0.0f,0.0f],translation:[0.0f,0.0f,0.0f]}}
execute summon item_display run function gm4_combat_expanded:boss/watchers/running/attack/warp/init_display
particle minecraft:reverse_portal ~ ~.75 ~ 0.15 0.15 0.15 2.5 64
