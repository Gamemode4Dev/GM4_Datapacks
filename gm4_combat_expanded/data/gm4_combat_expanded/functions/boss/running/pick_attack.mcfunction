
## STAGE 2
# Once Guardian HP drops below 50% the Sentinel will spawn to aid it, the Sentinel shares HP with the Guardian, both being defeated at the same time
execute if score @s[scores={gm4_ce_boss.stage=1},tag=!gm4_ce_boss.sentinel] gm4_ce_boss.health matches ..175 run scoreboard players set @s gm4_ce_boss.attack_id 7

## SLAM
# Guardian charges an attack over a medium duration, then explodes the ground below with a lingering damage cloud (dragon fireball)
# Stage 2: warp above a nearby player just before the slam (33%)
# players directly below the guardian (75%)
execute unless score @s[scores={gm4_ce_boss.attack_id=0}] gm4_ce_boss.last_attack matches 4 positioned ~-3 ~-20 ~-3 align xyz if entity @a[gamemode=!spectator,gamemode=!creative,dx=6,dy=17.5,dz=6] if predicate gm4_combat_expanded:technical/chance/boss/slam_attack run scoreboard players set @s gm4_ce_boss.attack_id 4

## EXPLODE MINIONS
# Guardian commands all living minions to explode, one after another
# Stage 2: dissapear while minions are exploding by teleporting 1000 blocks up (100%)
# players in vicinity of mobs (20%)
scoreboard players set $explode_minions_valid gm4_ce_boss 0
execute as @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.minion] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id at @s if entity @p[gamemode=!spectator,gamemode=!creative,distance=..6] if predicate gm4_combat_expanded:technical/chance/boss/explode_minions run scoreboard players set $explode_minions_valid gm4_ce_boss 1
execute unless score @s[scores={gm4_ce_boss.attack_id=0}] gm4_ce_boss.last_attack matches 6 if score $explode_minions_valid gm4_ce_boss matches 1 run scoreboard players set @s gm4_ce_boss.attack_id 6

## SUMMON MINIONS
# Guardian spawns 4 new minions around it to attack players
# Stage 2: raise blocks from the ground near players that also spawn mobs (2 per player) (60%)
# players in vicinity, not too many mobs alive (60%)
execute store result score $minion_count gm4_ce_boss if entity @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_boss.minion,distance=..64]
execute store result score $player_count gm4_ce_boss if entity @a[gamemode=!spectator,gamemode=!creative,distance=..32]
scoreboard players operation $mob_limit gm4_ce_boss = $mob_limit.boss_minions_per_player gm4_ce_data
scoreboard players operation $mob_limit gm4_ce_boss *= $player_count gm4_ce_boss
scoreboard players operation $mob_limit gm4_ce_boss += $mob_limit.boss_minions_base gm4_ce_data
execute unless score @s[scores={gm4_ce_boss.attack_id=0}] gm4_ce_boss.last_attack matches 5 unless score $minion_count gm4_ce_boss >= $mob_limit gm4_ce_boss if entity @a[gamemode=!spectator,gamemode=!creative,distance=..18] if predicate gm4_combat_expanded:technical/chance/boss/summon_minions run scoreboard players set @s gm4_ce_boss.attack_id 5

## FIREBALL
# Guardian tracks the closest player, firing 3 volleys of small fireballs followed by a large fireball
# Stage 2: spawn a second fireball that has better tracking just after the first (50%)
# players are nearby the guardian (40%)
execute unless score @s[scores={gm4_ce_boss.attack_id=0}] gm4_ce_boss.last_attack matches 2 if entity @p[gamemode=!spectator,gamemode=!creative,distance=4..18] if predicate gm4_combat_expanded:technical/chance/boss/fireball_attack run scoreboard players set @s gm4_ce_boss.attack_id 2

## AURA
# Guardian starts dealing damage around it, this damage ramps up over some time
# Stage 2: damage now also heals the Guardian (100%)
# if players are found closeby (60%)
execute unless score @s[scores={gm4_ce_boss.attack_id=0}] gm4_ce_boss.last_attack matches 9 if entity @p[gamemode=!spectator,gamemode=!creative,distance=..5.25] if predicate gm4_combat_expanded:technical/chance/boss/aura_attack run scoreboard players set @s gm4_ce_boss.attack_id 9

## WARP
# Guardian charges for a short duration, then warps away to a location nearby a player, can be above or next to them
# Stage 2: immediatly start another attack (100%)
# if players are found within warp range (100%)
execute unless score @s gm4_ce_boss.attack_id matches 1.. if entity @a[gamemode=!spectator,gamemode=!creative,distance=..48] run scoreboard players set @s gm4_ce_boss.attack_id 3

## SHIELD
# Guardian shields itself if it cannot find nearby players (100%)
execute unless score @s gm4_ce_boss.attack_id matches 1.. run scoreboard players set @s gm4_ce_boss.attack_id 8

# stop the boss from repeating attacks, except warp or shield
scoreboard players operation @s gm4_ce_boss.last_attack = @s gm4_ce_boss.attack_id
