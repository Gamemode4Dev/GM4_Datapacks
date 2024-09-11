
scoreboard players set $spawned_skeleton gm4_ce_boss 0
execute if score $boss_phase gm4_ce_boss matches 3.. if predicate gm4_combat_expanded:technical/chance/boss/skeleton_minion positioned ~ ~-1.6 ~ summon skeleton run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/init_skeleton
execute if score $spawned_skeleton gm4_ce_boss matches 0 positioned ~ ~-1.6 ~ summon zombie run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/init_zombie
execute unless block ~ ~-1 ~ #minecraft:air unless block ~ ~-1 ~ #minecraft:wither_immune run fill ~ ~-1 ~ ~ ~-1 ~ air destroy
kill @s
