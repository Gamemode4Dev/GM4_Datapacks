# init bossbar
# @s = boss shulker (main)
# at @s
# run from boss/watchers/activation/spawn/head

$bossbar add gm4_combat_expanded:boss_watcher_$(running_id) "Watchers"
$bossbar set gm4_combat_expanded:boss_watcher_$(running_id) color purple 
$bossbar set gm4_combat_expanded:boss_watcher_$(running_id) max 600
$bossbar set gm4_combat_expanded:boss_watcher_$(running_id) players @a[distance=..96]
