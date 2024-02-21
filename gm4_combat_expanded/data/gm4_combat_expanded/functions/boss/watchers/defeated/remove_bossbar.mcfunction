# remove bossbar linked to these watchers
# @s = boss shulker (main)
# at @s
# run from boss/watchers/defeated/kill_main

$bossbar remove gm4_combat_expanded:boss_watcher_$(running_id)
