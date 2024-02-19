
## SLAM
# Phase 1: Watcher charges an attack over a medium duration, then explodes the ground below with a lingering damage cloud (dragon fireball)
# Phase 2: attack charges much faster
# Phase 3: less delay after attack
# Phase 2: warp above a nearby player just before the slam (33%), slam attack charges faster
# Trigger: players below the Watcher (75%)
execute unless score @s[scores={gm4_ce_boss.attack_id=0}] gm4_ce_boss.last_attack matches 4 positioned ~-3 ~-20 ~-3 align xyz if entity @a[gamemode=!spectator,gamemode=!creative,dx=6,dy=16,dz=6] if predicate gm4_combat_expanded:technical/chance/boss/slam_attack run scoreboard players set @s gm4_ce_boss.attack_id 4

## EXPLODE MINIONS (main only)
# Phase 1: -
# Phase 2: Watcher dissapears and commands all living zombie minions to explode, one after another
# Phase 3: -
# Phase 4: minions start exploding earlier, explode faster after eachother
# Trigger: players close to mobs (40%)
scoreboard players set $explode_minions_valid gm4_ce_boss 0
execute as @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.minion] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id at @s if entity @p[gamemode=!spectator,gamemode=!creative,distance=..5] run scoreboard players set $explode_minions_valid gm4_ce_boss 1
execute unless score @s[tag=gm4_ce_boss.watcher.main,scores={gm4_ce_boss.attack_id=0,gm4_ce_boss.phase=2..}] gm4_ce_boss.last_attack matches 6 if score $explode_minions_valid gm4_ce_boss matches 1 if predicate gm4_combat_expanded:technical/chance/boss/explode_minions run scoreboard players set @s gm4_ce_boss.attack_id 6

## SUMMON MINIONS
# Phase 1: Watcher spawns a minion around it to attack players (mobs spawned from a sentinel count as belonging to the Watcher)
# Phase 2: spawn 2 (75%) or 4 (25%) minions instead
# Phase 3: can spawn skeletons (40%), minions are spawned faster
# Phase 4: minions are spawned faster
# Trigger: players in vicinity, not too many mobs alive (60%)
execute store result score $minion_count gm4_ce_boss if entity @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.minion,distance=..64]
execute store result score $player_count gm4_ce_boss if entity @a[gamemode=!spectator,gamemode=!creative,distance=..32]
scoreboard players operation $mob_limit gm4_ce_boss = $mob_limit.boss_minions_per_player gm4_ce_data
scoreboard players operation $mob_limit gm4_ce_boss *= $player_count gm4_ce_boss
execute unless score @s[scores={gm4_ce_boss.attack_id=0}] gm4_ce_boss.last_attack matches 5 unless score $minion_count gm4_ce_boss >= $mob_limit gm4_ce_boss if entity @a[gamemode=!spectator,gamemode=!creative,distance=5..18] if predicate gm4_combat_expanded:technical/chance/boss/summon_minions run scoreboard players set @s gm4_ce_boss.attack_id 5

## AURA
# Phase 1: -
# Phase 2: Watcher starts dealing damage around it, this damage ramps up over some time
# Phase 3: -
# Phase 4: attack spins up faster and deals more damage
# Trigger: players are found closeby (25% main, 100% secondary)
execute unless score @s[scores={gm4_ce_boss.attack_id=0,gm4_ce_boss.phase=2..}] gm4_ce_boss.last_attack matches 7 if entity @p[gamemode=!spectator,gamemode=!creative,distance=..5.25] positioned ~-5.5 ~-1.5 ~-5.5 if entity @p[gamemode=!spectator,gamemode=!creative,dx=10,dy=2,dz=10] if predicate gm4_combat_expanded:technical/chance/boss/aura_attack run scoreboard players set @s gm4_ce_boss.attack_id 7

## FIREBALL
# Phase 1: Watcher tracks the closest player, firing 3 volleys of small fireballs
# Phase 2: follows the small fireballs with a large one that explodes, follows tracking of the last small fireballs
# Phase 3: spawn a second fireball that has better tracking just after the first
# Phase 4: immediatly activate warp to dodge any return fireballs
# Trigger: players are a middle distance from the Watcher (80% main, 35% secondary)
execute unless score @s[scores={gm4_ce_boss.attack_id=0}] gm4_ce_boss.last_attack matches 2 if entity @p[gamemode=!spectator,gamemode=!creative,distance=8..20] if predicate gm4_combat_expanded:technical/chance/boss/fireball_attack run scoreboard players set @s gm4_ce_boss.attack_id 2

## WARP
# Phase 1: Watcher charges for a time, then warps away to a location nearby a player, can be above, next to, or far away from them
# Phase 2: charge time is shorter
# Phase 3: immediatly start another attack
# Phase 4: charge time is much shorter
# if players are found within warp range (100%)
execute unless score @s gm4_ce_boss.attack_id matches 1.. if entity @a[gamemode=!spectator,gamemode=!creative,distance=..64] run scoreboard players set @s gm4_ce_boss.attack_id 3

## SHIELD
# Watcher shields itself if it cannot find nearby players (100%)
execute unless score @s gm4_ce_boss.attack_id matches 1.. unless entity @a[gamemode=!spectator,gamemode=!creative,distance=..64] run scoreboard players set @s gm4_ce_boss.attack_id 8

# stop the boss from repeating attacks, except warp or shield
scoreboard players operation @s gm4_ce_boss.last_attack = @s gm4_ce_boss.attack_id
