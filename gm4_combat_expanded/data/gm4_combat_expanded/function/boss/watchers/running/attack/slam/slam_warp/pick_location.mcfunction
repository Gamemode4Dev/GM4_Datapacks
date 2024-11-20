
# teleport up to 8 blocks away
tag @s add gm4_ce_target
execute summon marker run function gm4_combat_expanded:boss/watchers/running/attack/slam/slam_warp/above_player/spawn_marker
tag @s remove gm4_ce_target

kill @e[type=item_display,tag=gm4_ce_boss.watcher.hurtbox,tag=gm4_ce_boss.watcher.running]
execute at @s as @e[tag=gm4_ce_boss.watcher.running,distance=0.1..] run tp @s ~ ~.5 ~
execute at @s run particle minecraft:portal ~ ~1.75 ~ 0 0 0 0.75 32
tp @e[type=item_display,tag=gm4_ce_boss.watcher.teleport_display,limit=1,sort=nearest] @s

playsound minecraft:entity.enderman.teleport hostile @a ~ ~ ~ 1 0.75
execute at @s run playsound minecraft:entity.enderman.teleport hostile @a ~ ~ ~ 1 0.75
