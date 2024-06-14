# calculate modifiers for newly spawned evoker
# @s = evoker
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -4 add_value
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.10 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 10
scoreboard players set $mob_damage gm4_ce_data 0
scoreboard players set $mob_speed gm4_ce_data 30
scoreboard players set $mob_armor gm4_ce_data 8
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 100

execute store result score $wave gm4_ce_data run data get entity @s Wave
execute store result score $patrol_leader gm4_ce_data run data get entity @s PatrolLeader

# | Modifiers
# leader
execute if score $patrol_leader gm4_ce_data matches 1 run scoreboard players add $difficulty gm4_ce_data 10
# raider
scoreboard players set $difficulty_add gm4_ce_data 4
scoreboard players operation $difficulty_add gm4_ce_data *= $wave gm4_ce_data
scoreboard players operation $difficulty gm4_ce_data += $difficulty_add gm4_ce_data

# cap difficulty
scoreboard players operation $difficulty gm4_ce_data < #100 gm4_ce_data

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
