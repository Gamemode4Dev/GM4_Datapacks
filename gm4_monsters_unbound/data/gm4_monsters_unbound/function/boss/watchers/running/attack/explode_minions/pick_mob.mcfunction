
execute as @e[type=#gm4_survival_refightalized:zombie_types,tag=gm4_mu_boss.watcher.minion_exploding] if score @s gm4_mu_boss.id = $running_id gm4_mu_boss.id run tag @s add gm4_mu_boss.watcher.valid_minion
execute as @e[type=#gm4_survival_refightalized:zombie_types,tag=gm4_mu_boss.watcher.valid_minion,limit=1,sort=random] at @s run function gm4_monsters_unbound:boss/watchers/running/attack/explode_minions/explode
execute store result score $minions_left gm4_mu_boss run tag @e[type=#gm4_survival_refightalized:zombie_types,tag=gm4_mu_boss.watcher.valid_minion] remove gm4_mu_boss.watcher.valid_minion

execute if score $minions_left gm4_mu_boss matches 1.. run scoreboard players set @s[scores={gm4_mu_boss.phase=..3}] gm4_mu_boss.attack_progress 26
execute if score $minions_left gm4_mu_boss matches 1.. run scoreboard players set @s[scores={gm4_mu_boss.phase=4}] gm4_mu_boss.attack_progress 29

execute unless score $minions_left gm4_mu_boss matches 1.. run function gm4_monsters_unbound:boss/watchers/running/attack/explode_minions/end
