# calculate modifiers for newly spawned creeper
# @s = creeper
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add gm4_combat_expanded:stat_change.base_nerf -4 add_value
attribute @s generic.movement_speed modifier add gm4_combat_expanded:stat_change.base_nerf -0.15 add_multiplied_base

# max stat buff
scoreboard players set $mob_health gm4_ce_data 10
scoreboard players set $mob_damage gm4_ce_data 0
scoreboard players set $mob_speed gm4_ce_data 24
scoreboard players set $mob_armor gm4_ce_data 14
scoreboard players set $mob_toughness gm4_ce_data 15
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 30

execute store result score $patrol_leader gm4_ce_data run data get entity @s PatrolLeader
execute store result score $patrolling gm4_ce_data run data get entity @s Patrolling
execute store result score $wave gm4_ce_data run data get entity @s Wave

# | Modifiers
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

# cap difficulty
scoreboard players operation $difficulty gm4_ce_data < #100 gm4_ce_data

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
