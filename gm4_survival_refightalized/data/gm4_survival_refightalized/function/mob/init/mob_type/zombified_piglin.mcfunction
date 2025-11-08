# calculate modifiers for newly spawned zombified piglin
# @s = zombified piglin
# at @s
# run from mob/init/mob_type

## Stat Block (normal/hard diff)
# health: 14 - 24
# damage: 5.5 - 7 (armed), 2.5 - 4 (unarmed)
# speed: 90 - 140%

# base stat nerf
attribute @s[tag=!gm4_sr_from_spawner] minecraft:max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -6 add_value
attribute @s minecraft:attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -2.5 add_value
attribute @s minecraft:movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.1 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 22
scoreboard players set $mob_damage gm4_sr_data 15
scoreboard players set $mob_speed gm4_sr_data 50
# max damage mob is allowed to deal in one hit (to deal with weapons)
scoreboard players set @s gm4_sr_mob.damage_cap 60
tag @s add gm4_sr_check_damage_cap

# remove zombie leader bonus
execute if data entity @s attributes[{id:"minecraft:max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}] run attribute @s minecraft:max_health modifier remove minecraft:leader_zombie_bonus
