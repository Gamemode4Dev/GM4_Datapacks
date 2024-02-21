
scoreboard players add @s gm4_ce_boss.attack_progress 1

scoreboard players set @s[scores={gm4_ce_boss.phase=1..2}] gm4_ce_boss.tick_delay 4
scoreboard players set @s[scores={gm4_ce_boss.phase=3}] gm4_ce_boss.tick_delay 3
scoreboard players set @s[scores={gm4_ce_boss.phase=4}] gm4_ce_boss.tick_delay 2

scoreboard players operation $boss_phase gm4_ce_boss = @s gm4_ce_boss.phase
execute if entity @s[tag=gm4_ce_boss.watcher.main] run scoreboard players operation $mob_id gm4_ce_boss.id = $running_id gm4_ce_boss.id
execute if entity @s[tag=gm4_ce_boss.watcher.secondary] run scoreboard players operation $mob_id gm4_ce_boss.id = @s gm4_ce_boss.secondary_id
execute as @e[type=item_display,tag=gm4_ce_boss.watcher.minion_grown,distance=..4] if score @s gm4_ce_boss.id = $mob_id gm4_ce_boss.id at @s run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/spawn_mob

execute if score @s gm4_ce_boss.attack_progress matches 1 run tp @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] ~ ~ ~ 0 -10
execute if score @s gm4_ce_boss.attack_progress matches 2 positioned ~ ~.6 ~1.15 run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/start_spawn
execute if score @s gm4_ce_boss.attack_progress matches 3 positioned ~ ~.6 ~1.15 as @e[type=item_display,distance=..4,tag=gm4_ce_boss.watcher.minion_growth,limit=1,sort=nearest] run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/grow_spawn

execute if score @s[scores={gm4_ce_boss.phase=1}] gm4_ce_boss.attack_progress matches 4 run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/end
execute if entity @s[scores={gm4_ce_boss.phase=2..,gm4_ce_boss.attack_progress=4},predicate=gm4_combat_expanded:technical/chance/boss/2_minions] run scoreboard players set @s gm4_ce_boss.attack_progress 14

execute if score @s gm4_ce_boss.attack_progress matches 4 run tp @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] ~ ~ ~ 90 -10
execute if score @s gm4_ce_boss.attack_progress matches 5 positioned ~-1.15 ~.6 ~ run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/start_spawn
execute if score @s gm4_ce_boss.attack_progress matches 6 positioned ~-1.15 ~.6 ~ as @e[type=item_display,distance=..4,tag=gm4_ce_boss.watcher.minion_growth,limit=1,sort=nearest] run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/grow_spawn

execute if score @s gm4_ce_boss.attack_progress matches 7 run tp @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] ~ ~ ~ 180 -10
execute if score @s gm4_ce_boss.attack_progress matches 8 positioned ~ ~.6 ~-1.15 run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/start_spawn
execute if score @s gm4_ce_boss.attack_progress matches 9 positioned ~ ~.6 ~-1.15 as @e[type=item_display,distance=..4,tag=gm4_ce_boss.watcher.minion_growth,limit=1,sort=nearest] run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/grow_spawn

execute if score @s gm4_ce_boss.attack_progress matches 10 run tp @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] ~ ~ ~ -90 -10
execute if score @s gm4_ce_boss.attack_progress matches 11 positioned ~1.15 ~.6 ~ run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/start_spawn
execute if score @s gm4_ce_boss.attack_progress matches 12 positioned ~1.15 ~.6 ~ as @e[type=item_display,distance=..4,tag=gm4_ce_boss.watcher.minion_growth,limit=1,sort=nearest] run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/grow_spawn

execute if score @s gm4_ce_boss.attack_progress matches 13 run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/end

# if only 2 minions are spawned
execute if score @s gm4_ce_boss.attack_progress matches 14 run tp @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] ~ ~ ~ 180 -10
execute if score @s gm4_ce_boss.attack_progress matches 15 positioned ~ ~.6 ~-1.15 run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/start_spawn
execute if score @s gm4_ce_boss.attack_progress matches 16 positioned ~ ~.6 ~-1.15 as @e[type=item_display,distance=..4,tag=gm4_ce_boss.watcher.minion_growth,limit=1,sort=nearest] run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/grow_spawn

execute if score @s gm4_ce_boss.attack_progress matches 17 run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/end
