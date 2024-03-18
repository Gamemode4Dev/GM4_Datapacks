
scoreboard players set @s gm4_ce_boss.attack_id 0
scoreboard players reset @s gm4_ce_boss.attack_progress
scoreboard players set @s[scores={gm4_ce_boss.phase=1}] gm4_ce_boss.tick_delay 25
scoreboard players set @s[scores={gm4_ce_boss.phase=1..2}] gm4_ce_boss.tick_delay 15
scoreboard players set @s[scores={gm4_ce_boss.phase=3..}] gm4_ce_boss.tick_delay 10
