
scoreboard players set @s gm4_mu_boss.attack_id 0
scoreboard players reset @s gm4_mu_boss.attack_progress
scoreboard players set @s[scores={gm4_mu_boss.phase=1}] gm4_mu_boss.tick_delay 40
scoreboard players set @s[scores={gm4_mu_boss.phase=1..2}] gm4_mu_boss.tick_delay 30
scoreboard players set @s[scores={gm4_mu_boss.phase=3..}] gm4_mu_boss.tick_delay 20
