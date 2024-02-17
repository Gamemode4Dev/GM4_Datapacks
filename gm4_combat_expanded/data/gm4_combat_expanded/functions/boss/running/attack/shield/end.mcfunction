
scoreboard players set @s gm4_ce_boss.attack_id 0
scoreboard players reset @s gm4_ce_boss.attack_progress
scoreboard players set @s gm4_ce_boss.tick_delay 1

function gm4_combat_expanded:boss/running/health/immune_remove with storage gm4_combat_expanded:temp boss
