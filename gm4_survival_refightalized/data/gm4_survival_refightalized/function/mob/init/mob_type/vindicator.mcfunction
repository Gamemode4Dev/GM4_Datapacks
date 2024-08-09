# calculate modifiers for newly spawned vindicator
# @s = vindicator
# at @s
# run from mob/init/mob_type

# starting stats (easy/normal/hard)
# health: 24
# damage: 13 (armed), 5 (unarmed)

# base stat nerf
attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -9 add_value
attribute @s generic.attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -4.5 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.10 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 24
scoreboard players set $mob_damage gm4_sr_data 25
scoreboard players set $mob_speed gm4_sr_data 36
# max damage mob is allowed to deal in one hit (to deal with weapons)
scoreboard players set @s gm4_sr_damage_cap 110
tag @s add gm4_sr_check_damage_cap

execute store result score $wave gm4_sr_data run data get entity @s Wave
execute store result score $patrol_leader gm4_sr_data run data get entity @s PatrolLeader

# | Modifiers
# leader
execute if score $patrol_leader gm4_sr_data matches 1 run scoreboard players add $difficulty gm4_sr_data 10
# raider
scoreboard players set $difficulty_add gm4_sr_data 4
scoreboard players operation $difficulty_add gm4_sr_data *= $wave gm4_sr_data
scoreboard players operation $difficulty gm4_sr_data += $difficulty_add gm4_sr_data

execute if score $wave gm4_sr_data matches 4.. run scoreboard players set $mob_health gm4_sr_data 36

# cap difficulty
scoreboard players operation $difficulty gm4_sr_data < #100 gm4_sr_data
