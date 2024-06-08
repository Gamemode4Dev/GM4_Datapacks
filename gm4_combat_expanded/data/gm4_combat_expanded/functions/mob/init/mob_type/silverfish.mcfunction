# calculate modifiers for newly spawned silverfish / endermite
# @s = silverfish / endermite
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -6 add_value
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.05 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 3
scoreboard players set $mob_damage gm4_ce_data 10
scoreboard players set $mob_speed gm4_ce_data 10
scoreboard players set $mob_armor gm4_ce_data 0
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 30

# | Biome Modifiers
# lush caves
tag @s[type=silverfish,predicate=gm4_combat_expanded:mob/modifier/lush_caves] add gm4_ce_infesting_attacks

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
