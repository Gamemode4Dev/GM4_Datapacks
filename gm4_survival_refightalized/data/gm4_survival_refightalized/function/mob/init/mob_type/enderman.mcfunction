# calculate modifiers for newly spawned enderman
# @s = enderman
# at @s
# run from mob/init/mob_type

## Stat Block (normal/hard diff)
# health: 40 - 55
# damage: 5 - 8
# speed: 90 - 125%

# base stat nerf
attribute @s minecraft:attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -2 add_value
attribute @s minecraft:movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.1 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 15
scoreboard players set $mob_damage gm4_sr_data 30
scoreboard players set $mob_speed gm4_sr_data 35
