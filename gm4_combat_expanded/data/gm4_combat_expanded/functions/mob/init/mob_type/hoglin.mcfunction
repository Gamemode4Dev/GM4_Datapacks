# calculate modifiers for newly spawned hoglin
# @s = hoglin
# at @s
# run from mob/init/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -16 add
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.14 multiply_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 100
scoreboard players set $mob_damage gm4_ce_data 22
scoreboard players set $mob_speed gm4_ce_data 16
scoreboard players set $mob_armor gm4_ce_data 24
scoreboard players set $mob_toughness gm4_ce_data 0

scoreboard players set $mob_health.cap gm4_ce_data 36
scoreboard players set $mob_damage.cap gm4_ce_data 6
scoreboard players set $mob_speed.cap gm4_ce_data 7
scoreboard players set $mob_armor.cap gm4_ce_data 6
scoreboard players set $mob_toughness.cap gm4_ce_data 0

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
