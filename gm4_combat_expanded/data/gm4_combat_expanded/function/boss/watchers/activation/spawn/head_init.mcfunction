# init boss scores
# @s = boss shulker (main)
# at @s
# run from boss/watchers/activation/spawn/head

scoreboard players operation @s gm4_ce_boss.id = $next_id gm4_ce_boss.id
execute unless score $boss_has_twin gm4_ce_boss matches 1 run scoreboard players set @s[tag=gm4_ce_boss.watcher.main] gm4_ce_boss.health 300
execute if score $boss_has_twin gm4_ce_boss matches 1 run scoreboard players set @s[tag=gm4_ce_boss.watcher.main] gm4_ce_boss.health 600
scoreboard players set @s[tag=gm4_ce_boss.watcher.main] gm4_ce_boss.attack_id 1
scoreboard players set @s[tag=gm4_ce_boss.watcher.main] gm4_ce_boss.phase 0
execute if score $boss_has_twin gm4_ce_boss matches 1 run tag @s[tag=gm4_ce_boss.watcher.main] add gm4_ce_boss.watcher.has_twin

tag @s remove gm4_ce_boss.watcher.new
