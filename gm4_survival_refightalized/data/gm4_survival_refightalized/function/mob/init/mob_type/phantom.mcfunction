# calculate modifiers for newly spawned phantom
# @s = phantom
# at @s
# run from mob/init/mob_type

# Stat Block (normal/hard diff)
# health: 4 - 16
# damage: 1.5 - 4
# speed: 100%

# base stat nerf
attribute @s max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -16 add_value
attribute @s attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -0.5 add_value

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 12
scoreboard players set $mob_damage gm4_sr_data 35
scoreboard players set $mob_speed gm4_sr_data 0
