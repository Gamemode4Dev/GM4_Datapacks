# update boss health bar
# @s = boss shulker (main)
# at @s
# run from boss/watchers/tick

$execute store result bossbar gm4_combat_expanded:boss_watcher_$(running_id) value run scoreboard players get @s gm4_ce_boss.health
$bossbar set gm4_combat_expanded:boss_watcher_$(running_id) players @a[distance=..96]
