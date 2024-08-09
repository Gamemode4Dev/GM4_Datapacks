# update boss health bar
# @s = boss shulker (main)
# at @s
# run from boss/watchers/tick

$execute store result bossbar gm4_monsters_unbound:boss_watcher_$(running_id) value run scoreboard players get @s gm4_mu_boss.health
$bossbar set gm4_monsters_unbound:boss_watcher_$(running_id) players @a[distance=..96]
