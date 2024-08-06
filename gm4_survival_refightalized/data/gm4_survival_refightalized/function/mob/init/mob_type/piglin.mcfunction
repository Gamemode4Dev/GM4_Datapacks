# calculate modifiers for newly spawned piglin
# @s = piglin
# at @s
# run from mob/init/mob_type

# starting stats (easy/normal/hard)
# health: 16
# damage: 8 (melee), 5 (unarmed)

# base stat nerf
attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -4 add_value
attribute @s generic.attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -1 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.04 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 20
scoreboard players set $mob_damage gm4_sr_data 20
scoreboard players set $mob_speed gm4_sr_data 12
# max damage mob is allowed to deal in one hit (to deal with weapons)
scoreboard players set @s gm4_sr_damage_cap 80
tag @s add gm4_sr_check_damage_cap

# set armor
loot replace entity @s armor.feet loot gm4_survival_refightalized:mob/equip_armor/piglin
