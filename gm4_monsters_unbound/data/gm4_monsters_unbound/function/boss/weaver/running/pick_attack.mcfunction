# pick a new attack
# @s = boss shulker
# at @s
# run from boss/watchers/running/process

## WEAVE
# Weaver stops and throws webs in all directions
# Phase 1: unlock attack
# Phase 2: gain a speed boost after the attack ends
# Trigger: players nearby the Weaver
execute unless score @s[scores={gm4_mu_boss.attack_id=0}] gm4_mu_boss.last_attack matches 4 positioned ~-3 ~-20 ~-3 align xyz if entity @a[gamemode=!spectator,gamemode=!creative,dx=6,dy=16,dz=6] if predicate gm4_monsters_unbound:chance/boss/watchers/slam_attack run scoreboard players set @s gm4_mu_boss.attack_id 4

## COCOON
# Weaver throws out a cocoon that if left alone will spawn weak small spiders with weaving
# Phase 1: -
# Phase 2: unlock attack
# Trigger: players nearby the Weaver
scoreboard players set $explode_minions_valid gm4_mu_boss 0
execute as @e[type=#gm4_survival_refightalized:zombie_types,tag=gm4_mu_boss.watcher.minion] if score @s gm4_mu_boss.id = $running_id gm4_mu_boss.id at @s if entity @p[gamemode=!spectator,gamemode=!creative,distance=..5] run scoreboard players set $explode_minions_valid gm4_mu_boss 1
execute unless score @s[tag=gm4_mu_boss.watcher.main,scores={gm4_mu_boss.attack_id=0,gm4_mu_boss.phase=2..}] gm4_mu_boss.last_attack matches 6 if score $explode_minions_valid gm4_mu_boss matches 1 if predicate gm4_monsters_unbound:chance/boss/watchers/explode_minions run scoreboard players set @s gm4_mu_boss.attack_id 6

## ENRAGE
# Watcher spawns a minion around it to attack players (mobs spawned from secondary count as belonging to the main Watcher)
# Zombies have a difficulty of 85 and Skeletons 65, used for armor spawns - these mobs do not get modifiers
# Phase 1: unlock attack
# Phase 2: spawn 2 (75%) or 4 (25%) minions instead
# Phase 3: can spawn skeletons (40%), minions are spawned faster
# Phase 4: minions are spawned faster
# Trigger: players in vicinity, not too many mobs alive (60%)
execute store result score $minion_count gm4_mu_boss if entity @e[type=#gm4_survival_refightalized:zombie_types,tag=gm4_mu_boss.watcher.minion,distance=..64]
execute store result score $player_count gm4_mu_boss if entity @a[gamemode=!spectator,gamemode=!creative,distance=..32]
scoreboard players operation $mob_limit gm4_mu_boss = $mob_limit.boss_minions_per_player gm4_mu_data
scoreboard players operation $mob_limit gm4_mu_boss *= $player_count gm4_mu_boss
execute unless score @s[scores={gm4_mu_boss.attack_id=0}] gm4_mu_boss.last_attack matches 5 unless score $minion_count gm4_mu_boss >= $mob_limit gm4_mu_boss if entity @a[gamemode=!spectator,gamemode=!creative,distance=5..18] if predicate gm4_monsters_unbound:chance/boss/watchers/summon_minions run scoreboard players set @s gm4_mu_boss.attack_id 5

## SHIELD
# Watcher shields itself if it cannot find nearby players (100%)
execute unless score @s gm4_mu_boss.attack_id matches 1.. unless entity @a[gamemode=!spectator,gamemode=!creative,distance=..64] run scoreboard players set @s gm4_mu_boss.attack_id 8

# stop the boss from repeating attacks, except warp or shield
scoreboard players operation @s gm4_mu_boss.last_attack = @s gm4_mu_boss.attack_id
