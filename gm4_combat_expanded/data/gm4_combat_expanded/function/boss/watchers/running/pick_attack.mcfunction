# pick a new attack
# @s = boss shulker
# at @s
# run from boss/watchers/running/process

## SLAM
# Watcher charges an attack over a medium duration, then explodes the ground below with a lingering damage cloud (dragon fireball)
# Slam deals 14 magic damage in a vertical column down from its location
# Players hit are affected by darkness, slowness, mining fatigue V and -6 armor for 10 seconds
# Phase 1: unlock attack
# Phase 2: -
# Phase 3: attack charges faster, act faster after the attack
# Phase 2: warp above a nearby player just before the slam (33%)
# Trigger: players below the Watcher (75%)
execute unless score @s[scores={gm4_ce_boss.attack_id=0}] gm4_ce_boss.last_attack matches 4 positioned ~-3 ~-20 ~-3 align xyz if entity @a[gamemode=!spectator,gamemode=!creative,dx=6,dy=16,dz=6] if predicate gm4_combat_expanded:technical/chance/boss/slam_attack run scoreboard players set @s gm4_ce_boss.attack_id 4

## EXPLODE MINIONS (main only)
# Watcher dissapears and commands all living zombie minions to explode, one after another
# Explosion can destroy some terrain and deals 18 / 10 explosion damage to players depending on distance
# Players hit are slowed by 40% for 10 seconds
# Phase 1: -
# Phase 2: unlock attack
# Phase 3: -
# Phase 4: minions start exploding earlier, explode faster after eachother
# Trigger: players close to mobs (40%)
scoreboard players set $explode_minions_valid gm4_ce_boss 0
execute as @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.watcher.minion] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id at @s if entity @p[gamemode=!spectator,gamemode=!creative,distance=..5] run scoreboard players set $explode_minions_valid gm4_ce_boss 1
execute unless score @s[tag=gm4_ce_boss.watcher.main,scores={gm4_ce_boss.attack_id=0,gm4_ce_boss.phase=2..}] gm4_ce_boss.last_attack matches 6 if score $explode_minions_valid gm4_ce_boss matches 1 if predicate gm4_combat_expanded:technical/chance/boss/explode_minions run scoreboard players set @s gm4_ce_boss.attack_id 6

## SUMMON MINIONS
# Watcher spawns a minion around it to attack players (mobs spawned from secondary count as belonging to the main Watcher)
# Zombies have a difficulty of 85 and Skeletons 65, used for armor spawns - these mobs do not get modifiers
# Phase 1: unlock attack
# Phase 2: spawn 2 (75%) or 4 (25%) minions instead
# Phase 3: can spawn skeletons (40%), minions are spawned faster
# Phase 4: minions are spawned faster
# Trigger: players in vicinity, not too many mobs alive (60%)
execute store result score $minion_count gm4_ce_boss if entity @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.watcher.minion,distance=..64]
execute store result score $player_count gm4_ce_boss if entity @a[gamemode=!spectator,gamemode=!creative,distance=..32]
scoreboard players operation $mob_limit gm4_ce_boss = $mob_limit.boss_minions_per_player gm4_ce_data
scoreboard players operation $mob_limit gm4_ce_boss *= $player_count gm4_ce_boss
execute unless score @s[scores={gm4_ce_boss.attack_id=0}] gm4_ce_boss.last_attack matches 5 unless score $minion_count gm4_ce_boss >= $mob_limit gm4_ce_boss if entity @a[gamemode=!spectator,gamemode=!creative,distance=5..18] if predicate gm4_combat_expanded:technical/chance/boss/summon_minions run scoreboard players set @s gm4_ce_boss.attack_id 5

## AURA
# Watcher starts spinning, then deals constant damage around it and knocking players back
# Damage ramps up from 3 to 10 wither damage
# Player within range have darkness applied
# Phase 1: -
# Phase 2: unlock attack
# Phase 3: -
# Phase 4: attack spins up faster
# Trigger: players are found closeby (100% main, 25% secondary)
execute unless score @s[scores={gm4_ce_boss.attack_id=0,gm4_ce_boss.phase=2..}] gm4_ce_boss.last_attack matches 7 if entity @p[gamemode=!spectator,gamemode=!creative,distance=..5.25] positioned ~-5.5 ~-1.5 ~-5.5 if entity @p[gamemode=!spectator,gamemode=!creative,dx=10,dy=2,dz=10] if predicate gm4_combat_expanded:technical/chance/boss/aura_attack run scoreboard players set @s gm4_ce_boss.attack_id 7

## FIREBALL
# Watcher marks the closest player, firing 3 volleys of fireworks after a delay
# Phase 1: Watcher tracks the closest player, firing 3 volleys of small fireballs
# Phase 2: follows the small fireballs with a large one that explodes
# Phase 3: fireworks come out faster, fireball is bigger
# Phase 4: immediatly warp away after firing the fireball
# Trigger: players are a middle distance from the Watcher (35% main, 80% secondary)
execute unless score @s[scores={gm4_ce_boss.attack_id=0}] gm4_ce_boss.last_attack matches 2 if entity @p[gamemode=!spectator,gamemode=!creative,distance=8..20] if predicate gm4_combat_expanded:technical/chance/boss/fireball_attack run scoreboard players set @s gm4_ce_boss.attack_id 2

## WARP
# Watcher charges for a time, then warps away to a different location nearby a player
# Can warp low or high up, main can warp close by, secondary can warp far away
# Phase 1: unlock attack
# Phase 2: charge time is shorter
# Phase 3: act faster after the warp
# Phase 4: charge time is shorter
# if players are found within warp range (100%)
execute unless score @s gm4_ce_boss.attack_id matches 1.. if entity @a[gamemode=!spectator,gamemode=!creative,distance=..64] run scoreboard players set @s gm4_ce_boss.attack_id 3

## SHIELD
# Watcher shields itself if it cannot find nearby players (100%)
execute unless score @s gm4_ce_boss.attack_id matches 1.. unless entity @a[gamemode=!spectator,gamemode=!creative,distance=..64] run scoreboard players set @s gm4_ce_boss.attack_id 8

# stop the boss from repeating attacks, except warp or shield
scoreboard players operation @s gm4_ce_boss.last_attack = @s gm4_ce_boss.attack_id
