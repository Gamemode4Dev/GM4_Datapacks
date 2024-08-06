# init boss scores
# @s = boss shulker (secondary)
# at @s
# run from boss/watchers/activation/spawn_sentinel/head

scoreboard players operation @s gm4_mu_boss.id = $next_id gm4_mu_boss.id
scoreboard players operation @s gm4_mu_boss.secondary_id = $running_id gm4_mu_boss.id
scoreboard players set @s[tag=gm4_mu_boss.watcher.secondary] gm4_mu_boss.attack_id 3
scoreboard players set @s[tag=gm4_mu_boss.watcher.secondary] gm4_mu_boss.phase 1
scoreboard players set @s[tag=gm4_mu_boss.watcher.secondary] gm4_mu_boss.tick_delay 5

tag @s remove gm4_mu_boss.watcher.new
