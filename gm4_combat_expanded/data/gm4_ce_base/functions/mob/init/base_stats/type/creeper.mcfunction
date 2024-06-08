# calculate modifiers for newly spawned creeper
# @s = creeper
# at @s
# run from mob/init/base_stats/check_type

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -5 add_value

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 12
scoreboard players set $mob_damage gm4_ce_data 0
scoreboard players set $mob_speed gm4_ce_data 15
scoreboard players set $mob_armor gm4_ce_data 7
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 80
