# calculate modifiers for newly spawned piglin brute
# @s = piglin brute
# at @s
# run from mob/init/mob_type

## Stat Block (normal/hard diff)
# health: 40 - 60
# damage: 6 - 8 (melee), 3 - 5 (unarmed)
# speed: 75 - 105%

# base stat nerf
attribute @s minecraft:max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -10 add_value
attribute @s minecraft:attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -4 add_value
attribute @s minecraft:movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.25 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 20
scoreboard players set $mob_damage gm4_sr_data 20
scoreboard players set $mob_speed gm4_sr_data 30
# max damage mob is allowed to deal in one hit (to deal with weapons)
scoreboard players set @s gm4_sr_mob.damage_cap 80
tag @s add gm4_sr_check_damage_cap
