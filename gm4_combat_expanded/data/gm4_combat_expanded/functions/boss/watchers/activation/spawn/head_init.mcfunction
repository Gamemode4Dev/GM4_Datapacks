
scoreboard players operation @s gm4_ce_boss.id = $next_id gm4_ce_boss.id
scoreboard players set @s[tag=gm4_ce_boss.watcher.main] gm4_ce_boss.health 600
scoreboard players set @s[tag=gm4_ce_boss.watcher.main] gm4_ce_boss.attack_id 1
scoreboard players set @s[tag=gm4_ce_boss.watcher.main] gm4_ce_boss.phase 0

tag @s remove gm4_ce_boss.watcher.new
