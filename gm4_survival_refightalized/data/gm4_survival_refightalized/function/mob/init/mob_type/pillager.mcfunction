# calculate modifiers for newly spawned creeper
# @s = creeper
# at @s
# run from mob/init/mob_type

# starting stats (easy/normal/hard)
# health: 24
# damage: ranged

# base stat nerf
attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -12 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.15 add_multiplied_base

# max stat buff
scoreboard players set $mob_health gm4_sr_data 22
scoreboard players set $mob_damage gm4_sr_data 0
scoreboard players set $mob_speed gm4_sr_data 26

# | Modifiers
execute store result score $patrol_leader gm4_sr_data run data get entity @s PatrolLeader
execute store result score $patrolling gm4_sr_data run data get entity @s Patrolling
execute store result score $wave gm4_sr_data run data get entity @s Wave

# leader
execute if score $patrol_leader gm4_sr_data matches 1 run scoreboard players add $difficulty gm4_sr_data 10
execute if score $patrol_leader gm4_sr_data matches 1 run enchant @s piercing
# patrolling
execute if score $patrolling gm4_sr_data matches 1 run scoreboard players set $mob_speed gm4_sr_data 32
# raider
scoreboard players set $difficulty_add gm4_sr_data 4
scoreboard players operation $difficulty_add gm4_sr_data *= $wave gm4_sr_data
scoreboard players operation $difficulty gm4_sr_data += $difficulty_add gm4_sr_data

execute if score $wave gm4_sr_data matches 4.. run scoreboard players set $mob_health gm4_sr_data 30

execute if score $wave gm4_sr_data matches 5.. store result score $piercing_chance gm4_sr_data run random value 4..8
execute if score $wave gm4_sr_data matches 5.. if score $piercing_chance gm4_sr_data < $wave gm4_sr_data run enchant @s piercing

# cap difficulty
scoreboard players operation $difficulty gm4_sr_data < #100 gm4_sr_data
