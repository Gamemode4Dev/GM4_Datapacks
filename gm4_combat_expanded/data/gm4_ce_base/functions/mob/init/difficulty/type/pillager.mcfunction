# calculate modifiers for newly spawned creeper
# @s = creeper
# at @s
# run from mob/init/difficulty/check_type

# get data
execute store result score $patrol_leader gm4_ce_data run data get entity @s PatrolLeader
execute store result score $patrolling gm4_ce_data run data get entity @s Patrolling
execute store result score $wave gm4_ce_data run data get entity @s Wave

# leader
execute if score $patrol_leader gm4_ce_data matches 1 run scoreboard players add $difficulty gm4_ce_data 10
execute if score $patrol_leader gm4_ce_data matches 1 run enchant @s piercing
# patrolling
execute if score $patrolling gm4_ce_data matches 1 run scoreboard players set $mob_speed gm4_ce_data 32
# raider
scoreboard players set $difficulty_add gm4_ce_data 4
scoreboard players operation $difficulty_add gm4_ce_data *= $wave gm4_ce_data
scoreboard players operation $difficulty gm4_ce_data += $difficulty_add gm4_ce_data

execute if score $wave gm4_ce_data matches 4.. run scoreboard players set $mob_health gm4_ce_data 18
execute if score $wave gm4_ce_data matches 4.. run scoreboard players set $mob_armor gm4_ce_data 24

execute if score $wave gm4_ce_data matches 5.. store result score $piercing_chance gm4_ce_data run random value 4..8
execute if score $wave gm4_ce_data matches 5.. if score $piercing_chance gm4_ce_data < $wave gm4_ce_data run enchant @s piercing

