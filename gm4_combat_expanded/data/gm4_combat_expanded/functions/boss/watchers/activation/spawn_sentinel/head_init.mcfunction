# init boss scores
# @s = boss shulker (secondary)
# at @s
# run from boss/watchers/activation/spawn_sentinel/head

scoreboard players operation @s gm4_ce_boss.id = $next_id gm4_ce_boss.id
scoreboard players operation @s gm4_ce_boss.secondary_id = $running_id gm4_ce_boss.id
scoreboard players set @s[tag=gm4_ce_boss.watcher.secondary] gm4_ce_boss.attack_id 3
scoreboard players set @s[tag=gm4_ce_boss.watcher.secondary] gm4_ce_boss.phase 1
scoreboard players set @s[tag=gm4_ce_boss.watcher.secondary] gm4_ce_boss.tick_delay 5

tag @s remove gm4_ce_boss.watcher.new
