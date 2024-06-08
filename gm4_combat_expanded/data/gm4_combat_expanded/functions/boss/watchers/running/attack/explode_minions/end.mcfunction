
scoreboard players set @s gm4_ce_boss.attack_id 0
scoreboard players reset @s gm4_ce_boss.attack_progress
scoreboard players set @s gm4_ce_boss.tick_delay 20

function gm4_combat_expanded:boss/watchers/running/attack/explode_minions/explode_warp/end
