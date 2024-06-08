# calculate modifiers for newly spawned slime / magma cube
# @s = slime / magma cube
# at @s
# run from mob/init/base_stats/check_type

# store size for changing
execute store result score $size gm4_ce_data run data get entity @s Size

# base stat nerf
execute unless score $size gm4_ce_data matches 0 run attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -3 add_value

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 13
scoreboard players set $mob_damage gm4_ce_data 0
scoreboard players set $mob_speed gm4_ce_data 0
scoreboard players set $mob_armor gm4_ce_data 0
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 80
