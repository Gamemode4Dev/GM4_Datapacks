# calculate modifiers for newly spawned wither skeleton
# @s = wither skeleton
# at @s
# run from mob/init/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -2 add
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -6 add
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.04 multiply_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 34
scoreboard players set $mob_damage gm4_ce_data 26
scoreboard players set $mob_speed gm4_ce_data 6
scoreboard players set $mob_armor gm4_ce_data 8
scoreboard players set $mob_toughness gm4_ce_data 14

scoreboard players set $mob_health.cap gm4_ce_data 14
scoreboard players set $mob_damage.cap gm4_ce_data 14
scoreboard players set $mob_speed.cap gm4_ce_data 6
scoreboard players set $mob_armor.cap gm4_ce_data 8
scoreboard players set $mob_toughness.cap gm4_ce_data 8

# knockback resistance
attribute @s generic.knockback_resistance modifier add 4e46c16d-ba22-495c-bbca-613c97176918 "gm4_ce_base_kb_resist" 0.666 add

# set armor
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/wither_skeleton
# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:mob/equip_weapon/wither_skeleton

# withering arrow
execute if data entity @s HandItems[{id:"minecraft:bow"}] store success score $arrow gm4_ce_data run loot replace entity @s weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/withering
execute if score $arrow gm4_ce_data matches 1 run data modify entity @s HandDropChances[1] set value 0.25F

# half droprate of armor in "Dark"
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/dark] ArmorDropChances set value [0.0452F,0.0452F,0.0452F,0.0452F]

# if weapon is held set hand droprate to 20% (unless in "Dark")
# weapon damage is always 5 (stone sword), and is removed in base damage nerf instead
execute if data entity @s HandItems[{id:"minecraft:stone_sword"}] run data modify entity @s[predicate=!gm4_combat_expanded:mob/modifier/dark] HandDropChances set value [0.20F,0.20F]

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data