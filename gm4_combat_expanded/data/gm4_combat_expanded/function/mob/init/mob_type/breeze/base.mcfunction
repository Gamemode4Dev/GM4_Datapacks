# calculate modifiers for newly spawned breeze
# @s = breeze
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add gm4_combat_expanded:stat_change.base_nerf -8 add_value

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 14
scoreboard players set $mob_damage gm4_ce_data 0
scoreboard players set $mob_speed gm4_ce_data 0
scoreboard players set $mob_armor gm4_ce_data 20
scoreboard players set $mob_toughness gm4_ce_data 10
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 75
