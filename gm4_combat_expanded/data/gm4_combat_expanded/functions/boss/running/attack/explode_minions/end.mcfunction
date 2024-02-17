
scoreboard players set @s gm4_ce_boss.attack_id 0
scoreboard players reset @s gm4_ce_boss.attack_progress
scoreboard players set @s gm4_ce_boss.tick_delay 10

execute if score @s gm4_ce_boss.phase matches 3.. run function gm4_combat_expanded:boss/running/attack/explode_minions/explode_warp/end
