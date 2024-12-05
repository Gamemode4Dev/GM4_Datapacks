# calculate modifiers for newly spawned wither skeleton
# @s = wither skeleton
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s minecraft:max_health modifier add gm4_combat_expanded:stat_change.base_nerf -2 add_value
attribute @s minecraft:movement_speed modifier add gm4_combat_expanded:stat_change.base_nerf -0.04 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 16
scoreboard players set $mob_damage gm4_ce_data 0
scoreboard players set $mob_speed gm4_ce_data 14
scoreboard players set $mob_armor gm4_ce_data 8
scoreboard players set $mob_toughness gm4_ce_data 12
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 140

# knockback resistance
attribute @s minecraft:knockback_resistance modifier add gm4_combat_expanded:stat_change.kb_resist 0.666 add_value

# set armor
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/wither_skeleton
# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:mob/equip_weapon/wither_skeleton

# withering arrow
execute if data entity @s HandItems[{id:"minecraft:bow"}] store success score $arrow gm4_ce_data run loot replace entity @s weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/withering
execute if score $arrow gm4_ce_data matches 1 run data modify entity @s HandDropChances[1] set value 0.25F

# if weapon is held set hand droprate to 20%
execute if data entity @s HandItems[{id:"minecraft:stone_sword"}] run data modify entity @s HandDropChances set value [0.20F,0.20F]

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
