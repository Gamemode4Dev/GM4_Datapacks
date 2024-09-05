# calculate modifiers for newly spawned zombified piglin
# @s = zombified piglin
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add gm4_combat_expanded:stat_change.base_nerf -3 add_value
attribute @s generic.attack_damage modifier add gm4_combat_expanded:stat_change.base_nerf -2.5 add_value
attribute @s generic.movement_speed modifier add gm4_combat_expanded:stat_change.base_nerf -0.02 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 18
scoreboard players set $mob_damage gm4_ce_data 55
scoreboard players set $mob_speed gm4_ce_data 25
scoreboard players set $mob_armor gm4_ce_data 0
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 90

# set armor
loot replace entity @s[predicate=gm4_combat_expanded:mob/modifier/nether/crimson_forest] armor.feet loot gm4_combat_expanded:mob/equip_armor/piglin
# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:weapon/sword/gold

# set droprate to 20%
data modify entity @s HandDropChances set value [0.20F,0.20F]

# remove zombie leader bonus
execute if data entity @s attributes[{id:"minecraft:generic.max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}] run data remove entity @s attributes[{id:"minecraft:generic.max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}]

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
