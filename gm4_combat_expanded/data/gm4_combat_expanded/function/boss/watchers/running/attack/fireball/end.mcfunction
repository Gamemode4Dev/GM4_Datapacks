
scoreboard players reset @s gm4_ce_boss.attack_progress
scoreboard players set @s[scores={gm4_ce_boss.phase=..3}] gm4_ce_boss.attack_id 0
scoreboard players set @s[scores={gm4_ce_boss.phase=1}] gm4_ce_boss.tick_delay 50
scoreboard players set @s[scores={gm4_ce_boss.phase=2..3}] gm4_ce_boss.tick_delay 40
# in phase 4 immediatly warp away
scoreboard players set @s[scores={gm4_ce_boss.phase=4}] gm4_ce_boss.attack_id 3
scoreboard players set @s[scores={gm4_ce_boss.phase=4}] gm4_ce_boss.tick_delay 1

execute as @a[tag=gm4_ce_boss.watcher.target] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run tag @s remove gm4_ce_boss.watcher.target
