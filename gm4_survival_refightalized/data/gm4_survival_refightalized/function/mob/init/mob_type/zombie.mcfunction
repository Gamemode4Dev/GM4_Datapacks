# calculate modifiers for newly spawned zombie / zombie villager
# @s = zombie (villager)
# at @s
# run from mob/init/mob_type

# Stat Block (normal/hard diff)
# health: 16 - 32
# damage: 2.5 - 6 (cap 8)
# speed: 85 - 120%

# base stat nerf
attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -4 add_value
attribute @s generic.attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -0.5 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.15 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 16
scoreboard players set $mob_damage gm4_sr_data 35
scoreboard players set $mob_speed gm4_sr_data 35
# max damage mob is allowed to deal in one hit (to deal with weapons)
scoreboard players set @s gm4_sr_damage_cap 80
tag @s add gm4_sr_check_damage_cap

# set armor
execute store result score $armor_chance gm4_sr_data run random value 0..15
loot replace entity @s armor.feet loot gm4_survival_refightalized:mob/equip_armor/generic/feet
loot replace entity @s armor.legs loot gm4_survival_refightalized:mob/equip_armor/generic/legs
loot replace entity @s armor.chest loot gm4_survival_refightalized:mob/equip_armor/generic/chest
loot replace entity @s armor.head loot gm4_survival_refightalized:mob/equip_armor/generic/head

# remove leader and baby zombies
scoreboard players set $removed_bonus gm4_sr_data 0
execute if data entity @s attributes[{id:"minecraft:generic.max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}] store success score $removed_bonus gm4_sr_data run attribute @s minecraft:generic.max_health modifier remove minecraft:leader_zombie_bonus
execute if data entity @s {IsBaby:1b} store success score $removed_bonus gm4_sr_data run data modify entity @s IsBaby set value 0b
execute if score $removed_bonus gm4_sr_data matches 1 run tag @s add gm4_sr_was_leader_or_baby
