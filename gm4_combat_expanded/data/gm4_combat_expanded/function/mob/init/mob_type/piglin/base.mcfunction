# calculate modifiers for newly spawned piglin
# @s = piglin
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add gm4_combat_expanded:stat_change.base_nerf -2 add_value
attribute @s generic.attack_damage modifier add gm4_combat_expanded:stat_change.base_nerf -0.5 add_value
attribute @s generic.movement_speed modifier add gm4_combat_expanded:stat_change.base_nerf -0.04 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 16
scoreboard players set $mob_damage gm4_ce_data 0
scoreboard players set $mob_speed gm4_ce_data 8
scoreboard players set $mob_armor gm4_ce_data 4
scoreboard players set $mob_toughness gm4_ce_data 8
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 110

# | Modifiers
# crimson forest
execute if predicate gm4_combat_expanded:mob/modifier/nether/crimson_forest run scoreboard players set $mob_health gm4_ce_data 46

# set armor
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/piglin
