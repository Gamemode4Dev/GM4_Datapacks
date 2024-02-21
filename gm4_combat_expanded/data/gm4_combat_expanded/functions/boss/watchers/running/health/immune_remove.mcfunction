# set boss to no longer be immune to damage
# @s = boss shulker
# at @s
# run from boss/watchers/running/attack/explode_minions/explode_warp/end
# run from boss/watchers/running/attack/shield/end

tag @s remove gm4_ce_boss.watcher.immune

execute as @e[type=item_display,tag=gm4_ce_boss.watcher.shield] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run kill @s
