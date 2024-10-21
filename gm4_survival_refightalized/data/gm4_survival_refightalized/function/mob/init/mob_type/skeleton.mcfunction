# calculate modifiers for newly spawned skeleton / stray / bogged
# @s = skeleton / stray / bogged
# at @s
# run from mob/init/mob_type

# Stat Block (normal/hard diff)
# health: 9 - 22
# damage: 2 - 6.5 (cap 7)
# speed: 75 - 105%

# base stat nerf
attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -11 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.25 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 13
scoreboard players set $mob_damage gm4_sr_data 45
scoreboard players set $mob_speed gm4_sr_data 30
# max damage mob is allowed to deal in one hit (to deal with weapons)
scoreboard players set @s gm4_sr_mob.damage_cap 70
tag @s add gm4_sr_check_damage_cap

# arrow damage
execute store result score @s gm4_sr_arrow.damage_change run random value -4..4
scoreboard players set @s gm4_sr_arrow.fire_delay 3

# set armor
execute store result score $armor_chance gm4_sr_data run random value 0..15
loot replace entity @s armor.feet loot gm4_survival_refightalized:mob/generic/feet
loot replace entity @s armor.legs loot gm4_survival_refightalized:mob/generic/legs
loot replace entity @s armor.chest loot gm4_survival_refightalized:mob/generic/chest
loot replace entity @s armor.head loot gm4_survival_refightalized:mob/generic/head
# set weapon
loot replace entity @s[tag=!gm4_sr_melee_skeleton] weapon.mainhand loot gm4_survival_refightalized:mob/skeleton/weapon
