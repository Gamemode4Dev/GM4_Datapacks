# calculate modifiers for newly spawned blaze
# @s = blaze
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -8 add_value
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -3 add_value

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 13
scoreboard players set $mob_damage gm4_ce_data 45
scoreboard players set $mob_speed gm4_ce_data 0
scoreboard players set $mob_armor gm4_ce_data 20
scoreboard players set $mob_toughness gm4_ce_data 10
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 75

# | Biome Modifiers
# nether wastes
attribute @s[predicate=gm4_combat_expanded:mob/modifier/nether/nether_wastes] generic.movement_speed modifier add 069b5956-3cc2-4201-8550-a5d2f9552556 "gm4_ce_modifier_nether_wastes" 1 add_multiplied_base

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
