
scoreboard players set @s gm4_ce_boss.attack_id 0
scoreboard players reset @s gm4_ce_boss.attack_progress
scoreboard players set @s gm4_ce_boss.tick_delay 30

execute as @a[tag=gm4_ce_boss.target] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run tag @s remove gm4_ce_boss.target
