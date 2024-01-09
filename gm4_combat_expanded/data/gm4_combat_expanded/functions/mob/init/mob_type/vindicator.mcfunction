# calculate modifiers for newly spawned creeper
# @s = creeper
# at @s
# run from mob/init/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -2 add
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -3 add
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.1 multiply_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 40
scoreboard players set $mob_damage gm4_ce_data 20
scoreboard players set $mob_speed gm4_ce_data 24
scoreboard players set $mob_armor gm4_ce_data 36
scoreboard players set $mob_toughness gm4_ce_data 30

scoreboard players set $mob_health.cap gm4_ce_data 24
scoreboard players set $mob_damage.cap gm4_ce_data 7
scoreboard players set $mob_speed.cap gm4_ce_data 15
scoreboard players set $mob_armor.cap gm4_ce_data 14
scoreboard players set $mob_toughness.cap gm4_ce_data 5

execute store result score $wave gm4_ce_data run data get entity @s Wave

# | Modifiers
scoreboard players set $difficulty_add gm4_ce_data 4
scoreboard players operation $difficulty_add gm4_ce_data *= $wave gm4_ce_data
scoreboard players operation $difficulty gm4_ce_data += $difficulty_add gm4_ce_data

execute if score $wave gm4_ce_data matches 4.. run scoreboard players set $mob_health gm4_ce_data 60
execute if score $wave gm4_ce_data matches 4.. run scoreboard players set $mob_toughness.cap gm4_ce_data 12

# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:weapon/axe/iron

# set droprate to 40%
data modify entity @s HandDropChances set value [0.40F,0.40F]

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
