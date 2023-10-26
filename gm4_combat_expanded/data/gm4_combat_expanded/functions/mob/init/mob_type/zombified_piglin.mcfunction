# calculate modifiers for newly spawned zombified piglin
# @s = zombified piglin
# at @s
# run from mob/init/initiate

# TODO: what if spawns from zombification?

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -3 add
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -1 add
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.02 multiply_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 50
scoreboard players set $mob_damage gm4_ce_data 12
scoreboard players set $mob_speed gm4_ce_data 20
scoreboard players set $mob_armor gm4_ce_data 8
scoreboard players set $mob_toughness gm4_ce_data 4

# translate stat buffs using difficulty
scoreboard players operation $mob_health gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_damage gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_armor gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_toughness gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_health gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_damage gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_armor gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_toughness gm4_ce_data /= #100 gm4_ce_data

# set armor
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/piglin
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:weapon/sword/gold

# half droprate of armor in "Dark"
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/dark] ArmorDropChances set value [0.0452F,0.0452F,0.0452F,0.0452F]

# set droprate to 20% (unless in "Dark")
data modify entity @s[predicate=!gm4_combat_expanded:mob/modifier/dark] HandDropChances set value [0.20F,0.20F]

# set modifiers
function gm4_combat_expanded:mob/init/modifier/stat/prep
