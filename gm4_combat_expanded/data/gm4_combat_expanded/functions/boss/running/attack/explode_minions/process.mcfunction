
scoreboard players add @s gm4_ce_boss.attack_progress 1
scoreboard players set @s gm4_ce_boss.tick_delay 1

execute if score @s gm4_ce_boss.attack_progress matches 1 as @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.minion] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run function gm4_combat_expanded:boss/running/attack/explode_minions/prime
execute if score @s gm4_ce_boss.attack_progress matches 1..25 as @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.minion_exploding] at @s run particle dragon_breath ~ ~1.6 ~ 0.2 0.2 0.2 0.02 16
execute if score @s gm4_ce_boss.attack_progress matches 26.. as @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.minion_exploding] at @s run particle dragon_breath ~ ~1.6 ~ 0.2 0.2 0.2 0.2 8

execute if score @s gm4_ce_boss.attack_progress matches 31 as @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.minion_exploding] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run tag @s add gm4_ce_boss.valid_minion
execute if score @s gm4_ce_boss.attack_progress matches 31 as @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.valid_minion,limit=1,sort=random] at @s run function gm4_combat_expanded:boss/running/attack/explode_minions/explode
scoreboard players set $minions_left gm4_ce_boss 0
execute if score @s gm4_ce_boss.attack_progress matches 31 store success score $minions_left gm4_ce_boss run tag @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.valid_minion] remove gm4_ce_boss.valid_minion
execute if score $minions_left gm4_ce_boss matches 1 run scoreboard players set @s gm4_ce_boss.attack_progress 27

execute if score @s gm4_ce_boss.attack_progress matches 32.. run function gm4_combat_expanded:boss/running/attack/explode_minions/end
