
scoreboard players add @s gm4_ce_boss.attack_progress 1
scoreboard players set @s gm4_ce_boss.tick_delay 1

execute if score @s gm4_ce_boss.attack_progress matches 2 run function gm4_combat_expanded:boss/watchers/running/attack/explode_minions/explode_warp/away
scoreboard players set @s[scores={gm4_ce_boss.attack_progress=2,gm4_ce_boss.phase=4}] gm4_ce_boss.attack_progress 12

execute if score @s gm4_ce_boss.attack_progress matches 1 as @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.watcher.minion] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run function gm4_combat_expanded:boss/watchers/running/attack/explode_minions/prime
execute if score @s gm4_ce_boss.attack_progress matches 1..25 as @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.watcher.minion_exploding] at @s run particle dragon_breath ~ ~1.6 ~ 0.2 0.2 0.2 0.02 4
execute if score @s gm4_ce_boss.attack_progress matches 26.. as @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.watcher.minion_exploding] at @s run particle dragon_breath ~ ~1.6 ~ 0.2 0.2 0.2 0.2 6

execute if score @s gm4_ce_boss.attack_progress matches 31.. run function gm4_combat_expanded:boss/watchers/running/attack/explode_minions/pick_mob
