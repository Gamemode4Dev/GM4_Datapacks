# calculate modifiers for newly spawned zombified piglin
# @s = zombified piglin
# at @s
# run from mob/init/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -3 add
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -2.5 add
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.02 multiply_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 30
scoreboard players set $mob_damage gm4_ce_data 30
scoreboard players set $mob_speed gm4_ce_data 25
scoreboard players set $mob_armor gm4_ce_data 0
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 60

# set armor
loot replace entity @s[predicate=gm4_combat_expanded:mob/modifier/nether/crimson_forest] armor.feet loot gm4_combat_expanded:mob/equip_armor/piglin
# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:weapon/sword/gold

# half droprate of armor in "Dark"
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/dark] ArmorDropChances set value [0.0452F,0.0452F,0.0452F,0.0452F]

# set droprate to 20% (unless in "Dark")
data modify entity @s[predicate=!gm4_combat_expanded:mob/modifier/dark] HandDropChances set value [0.20F,0.20F]

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
