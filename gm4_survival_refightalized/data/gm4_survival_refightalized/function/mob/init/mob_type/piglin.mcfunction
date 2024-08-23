# calculate modifiers for newly spawned piglin
# @s = piglin
# at @s
# run from mob/init/mob_type

# Stat Block (normal/hard diff)
# health: 16 - 32
# damage: 5 - 7 (melee), 2 - 4 (unarmed)
# speed: 80 - 115%

# base stat nerf
attribute @s generic.attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -3 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.2 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 16
scoreboard players set $mob_damage gm4_sr_data 20
scoreboard players set $mob_speed gm4_sr_data 35
# max damage mob is allowed to deal in one hit (to deal with weapons)
scoreboard players set @s gm4_sr_damage_cap 70
tag @s add gm4_sr_check_damage_cap

# set armor
loot replace entity @s armor.feet loot gm4_survival_refightalized:mob/equip_armor/piglin/feet
loot replace entity @s armor.legs loot gm4_survival_refightalized:mob/equip_armor/piglin/legs
loot replace entity @s armor.chest loot gm4_survival_refightalized:mob/equip_armor/piglin/chest
loot replace entity @s armor.head loot gm4_survival_refightalized:mob/equip_armor/piglin/head
