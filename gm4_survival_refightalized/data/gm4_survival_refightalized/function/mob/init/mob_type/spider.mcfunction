# calculate modifiers for newly spawned spider
# @s = spider
# at @s
# run from mob/init/mob_type

## Stat Block (normal/hard diff)
# health: 12 - 30
# damage: 2 - 5.5
# speed: 95 - 145%

# base stat nerf
attribute @s[tag=!gm4_sr_from_spawner] minecraft:max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -4 add_value
attribute @s minecraft:movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.05 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 18
scoreboard players set $mob_damage gm4_sr_data 35
scoreboard players set $mob_speed gm4_sr_data 50
