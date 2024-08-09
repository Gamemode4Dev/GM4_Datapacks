# calculate modifiers for newly spawned ravager
# @s = ravager
# at @s
# run from mob/init/mob_type

# starting stats (easy/normal/hard)
# health: 100
# damage: 12

# base stat nerf
attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -40 add_value
attribute @s generic.attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -4 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.16 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 90
scoreboard players set $mob_damage gm4_sr_data 90
scoreboard players set $mob_speed gm4_sr_data 30

execute store result score $wave gm4_sr_data run data get entity @s Wave

# | Modifiers
# raider
scoreboard players set $difficulty_add gm4_sr_data 4
scoreboard players operation $difficulty_add gm4_sr_data *= $wave gm4_sr_data
scoreboard players operation $difficulty gm4_sr_data += $difficulty_add gm4_sr_data

# cap difficulty
scoreboard players operation $difficulty gm4_sr_data < #100 gm4_sr_data
