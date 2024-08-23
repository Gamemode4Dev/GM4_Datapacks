# calculate modifiers for newly spawned creeper
# @s = creeper
# at @s
# run from mob/init/mob_type

# Stat Block (normal/hard diff)
# health: 12 - 24
# damage: explosion
# speed: 90 - 125%

# base stat nerf
attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -8 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.1 add_value

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 12
scoreboard players set $mob_damage gm4_sr_data 0
scoreboard players set $mob_speed gm4_sr_data 35
