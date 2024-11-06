# calculate modifiers for newly spawned cave spider
# @s = cave spider
# at @s
# run from mob/init/mob_type

# Stat Block (normal/hard diff)
# health: 4 - 12
# damage: 0.5 - 1.5
# speed: 90 - 135%

# base stat nerf
attribute @s max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -8 add_value
attribute @s attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -1.5 add_value
attribute @s movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.1 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 8
scoreboard players set $mob_damage gm4_sr_data 10
scoreboard players set $mob_speed gm4_sr_data 45
