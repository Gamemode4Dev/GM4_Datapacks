# calculate modifiers for newly spawned skeleton / stray
# @s = skeleton / stray
# at @s
# run from mob/init/mob_type

# starting stats (easy/normal/hard)
# health: 20
# damage: 2

# base stat nerf
attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -8 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.25 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 16
scoreboard players set $mob_damage gm4_sr_data 35
scoreboard players set $mob_speed gm4_sr_data 30
# max damage mob is allowed to deal in one hit (to deal with weapons)
scoreboard players set @s gm4_sr_damage_cap 70
tag @s add gm4_sr_check_damage_cap

# set armor
loot replace entity @s armor.feet loot gm4_survival_refightalized:mob/equip_armor/generic/feet
loot replace entity @s armor.legs loot gm4_survival_refightalized:mob/equip_armor/generic/legs
loot replace entity @s armor.chest loot gm4_survival_refightalized:mob/equip_armor/generic/chest
loot replace entity @s armor.head loot gm4_survival_refightalized:mob/equip_armor/generic/head
# set weapon
loot replace entity @s weapon.mainhand loot gm4_survival_refightalized:mob/equip_weapon/skeleton
