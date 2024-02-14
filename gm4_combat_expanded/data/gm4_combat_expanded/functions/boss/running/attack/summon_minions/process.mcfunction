
scoreboard players add @s gm4_ce_boss.attack_progress 1

scoreboard players set @s gm4_ce_boss.tick_delay 3
execute as @e[type=item_display,tag=gm4_ce_boss.minion_grown] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id at @s run function gm4_combat_expanded:boss/running/attack/summon_minions/spawn_mob

execute if score @s gm4_ce_boss.attack_progress matches 1 run tp @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] ~ ~ ~ 0 0
execute if score @s gm4_ce_boss.attack_progress matches 2 positioned ~ ~.5 ~1.25 run function gm4_combat_expanded:boss/running/attack/summon_minions/start_spawn
execute if score @s gm4_ce_boss.attack_progress matches 3 positioned ~ ~.5 ~1.25 as @e[type=item_display,tag=gm4_ce_boss.minion_growth,limit=1,sort=nearest] run function gm4_combat_expanded:boss/running/attack/summon_minions/grow_spawn

execute if score @s gm4_ce_boss.attack_progress matches 4 run tp @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] ~ ~ ~ 90 0
execute if score @s gm4_ce_boss.attack_progress matches 5 positioned ~-1.25 ~.5 ~ run function gm4_combat_expanded:boss/running/attack/summon_minions/start_spawn
execute if score @s gm4_ce_boss.attack_progress matches 6 positioned ~-1.25 ~.5 ~ as @e[type=item_display,tag=gm4_ce_boss.minion_growth,limit=1,sort=nearest] run function gm4_combat_expanded:boss/running/attack/summon_minions/grow_spawn

execute if score @s gm4_ce_boss.attack_progress matches 7 run tp @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] ~ ~ ~ 180 0
execute if score @s gm4_ce_boss.attack_progress matches 8 positioned ~ ~.5 ~-1.25 run function gm4_combat_expanded:boss/running/attack/summon_minions/start_spawn
execute if score @s gm4_ce_boss.attack_progress matches 9 positioned ~ ~.5 ~-1.25 as @e[type=item_display,tag=gm4_ce_boss.minion_growth,limit=1,sort=nearest] run function gm4_combat_expanded:boss/running/attack/summon_minions/grow_spawn

execute if score @s gm4_ce_boss.attack_progress matches 10 run tp @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] ~ ~ ~ -90 0
execute if score @s gm4_ce_boss.attack_progress matches 11 positioned ~1.25 ~.5 ~ run function gm4_combat_expanded:boss/running/attack/summon_minions/start_spawn
execute if score @s gm4_ce_boss.attack_progress matches 12 positioned ~1.25 ~.5 ~ as @e[type=item_display,tag=gm4_ce_boss.minion_growth,limit=1,sort=nearest] run function gm4_combat_expanded:boss/running/attack/summon_minions/grow_spawn

execute if score @s gm4_ce_boss.attack_progress matches 13 run function gm4_combat_expanded:boss/running/attack/summon_minions/end
