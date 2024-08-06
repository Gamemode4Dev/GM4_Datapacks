# calculate modifiers for newly spawned wither skeleton
# @s = wither skeleton
# at @s
# run from mob/init/mob_type

# starting stats (easy/normal/hard)
# health: 20
# damage: 8 (armed), 2 (unarmed)

# base stat nerf
attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -6 add_value
attribute @s generic.attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -1.5 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.04 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 16
scoreboard players set $mob_damage gm4_sr_data 20
scoreboard players set $mob_speed gm4_sr_data 14
# max damage mob is allowed to deal in one hit (to deal with weapons)
scoreboard players set @s gm4_sr_damage_cap 85
tag @s add gm4_sr_check_damage_cap

# knockback resistance
attribute @s generic.knockback_resistance modifier add gm4_survival_refightalized:stat_change.kb_resist 0.666 add_value

# set armor
loot replace entity @s armor.feet loot gm4_survival_refightalized:mob/equip_armor/wither_skeleton
# set weapon
loot replace entity @s weapon.mainhand loot gm4_survival_refightalized:mob/equip_weapon/wither_skeleton

# withering arrow
execute if data entity @s HandItems[{id:"minecraft:bow"}] store success score $arrow gm4_sr_data run loot replace entity @s weapon.offhand loot gm4_survival_refightalized:mob/equip_arrow/withering
execute if score $arrow gm4_sr_data matches 1 run data modify entity @s HandDropChances[1] set value 0.25F
