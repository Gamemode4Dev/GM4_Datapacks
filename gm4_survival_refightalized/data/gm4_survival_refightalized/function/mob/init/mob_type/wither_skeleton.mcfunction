# calculate modifiers for newly spawned wither skeleton
# @s = wither skeleton
# at @s
# run from mob/init/mob_type

# Stat Block (normal/hard diff)
# health: 22 - 32
# damage: 6.5 - 8.5 (armed), 0.5 - 2.5 (unarmed)
# speed: 95 - 120%

# base stat nerf
attribute @s max_health modifier add gm4_survival_refightalized:stat_change.base_buff 2 add_value
attribute @s attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -1.5 add_value
attribute @s movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.05 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 10
scoreboard players set $mob_damage gm4_sr_data 20
scoreboard players set $mob_speed gm4_sr_data 25
# max damage mob is allowed to deal in one hit (to deal with weapons)
scoreboard players set @s gm4_sr_mob.damage_cap 85
tag @s add gm4_sr_check_damage_cap

# knockback resistance
attribute @s knockback_resistance modifier add gm4_survival_refightalized:stat_change.kb_resist 0.666 add_value

# set armor
loot replace entity @s armor.feet loot gm4_survival_refightalized:mob/wither_skeleton/feet
loot replace entity @s armor.legs loot gm4_survival_refightalized:mob/wither_skeleton/legs
loot replace entity @s armor.chest loot gm4_survival_refightalized:mob/wither_skeleton/chest
loot replace entity @s armor.head loot gm4_survival_refightalized:mob/wither_skeleton/head
# set weapon
loot replace entity @s weapon.mainhand loot gm4_survival_refightalized:mob/wither_skeleton/weapon

# withering arrow if a bow is held
execute if data entity @s HandItems[{id:"minecraft:bow"}] run loot replace entity @s weapon.offhand loot gm4_survival_refightalized:mob/wither_skeleton/arrow

# shoot arrows slower and weaker
scoreboard players set @s gm4_sr_arrow.fire_delay 4
execute store result score @s gm4_sr_arrow.damage_change run random value -6..0
