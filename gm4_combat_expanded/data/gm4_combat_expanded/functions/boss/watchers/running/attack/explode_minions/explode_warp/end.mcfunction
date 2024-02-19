
execute as @e[tag=gm4_ce_boss.watcher.head,tag=gm4_ce_boss.running,tag=!gm4_ce_boss.slam_block] run data merge entity @s {start_interpolation:-1,interpolation_duration:3,transformation:{scale:[0.5f,0.5f,0.5f],translation:[-0.5f,0.5f,0.4375f]}}
execute as @e[type=item_display,tag=gm4_ce_boss.watcher.head,tag=gm4_ce_boss.running,tag=!gm4_ce_boss.slam_block] run data modify entity @s transformation.scale set from entity @s item.tag.return.scale
execute as @e[type=item_display,tag=gm4_ce_boss.watcher.head,tag=gm4_ce_boss.running,tag=!gm4_ce_boss.slam_block] run data modify entity @s transformation.translation set from entity @s item.tag.return.translation
execute as @e[type=item_display,tag=gm4_ce_boss.explode_hide_display] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run kill @s
function gm4_combat_expanded:boss/watchers/running/health/immune_remove
