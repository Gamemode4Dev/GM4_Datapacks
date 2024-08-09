# calculate modifiers for newly spawned silverfish / endermite
# @s = silverfish / endermite
# at @s
# run from mob/init/mob_type

# starting stats (easy/normal/hard)
# health: 8
# damage: 1

# base stat nerf
attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -6 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.35 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 8
scoreboard players set $mob_damage gm4_sr_data 15
scoreboard players set $mob_speed gm4_sr_data 70
