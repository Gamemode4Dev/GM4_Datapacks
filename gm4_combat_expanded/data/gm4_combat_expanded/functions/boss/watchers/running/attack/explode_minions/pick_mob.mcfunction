
execute as @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.watcher.minion_exploding] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run tag @s add gm4_ce_boss.watcher.valid_minion
execute as @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.watcher.valid_minion,limit=1,sort=random] at @s run function gm4_combat_expanded:boss/watchers/running/attack/explode_minions/explode
execute store result score $minions_left gm4_ce_boss run tag @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.watcher.valid_minion] remove gm4_ce_boss.watcher.valid_minion

execute if score $minions_left gm4_ce_boss matches 1.. run scoreboard players set @s[scores={gm4_ce_boss.phase=..3}] gm4_ce_boss.attack_progress 26
execute if score $minions_left gm4_ce_boss matches 1.. run scoreboard players set @s[scores={gm4_ce_boss.phase=4}] gm4_ce_boss.attack_progress 29

execute unless score $minions_left gm4_ce_boss matches 1.. run function gm4_combat_expanded:boss/watchers/running/attack/explode_minions/end
