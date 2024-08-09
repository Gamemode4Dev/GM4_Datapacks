# calculate modifiers for newly spawned hoglin / zoglin
# @s = hoglin / zoglin
# at @s
# run from mob/init/mob_type

# starting stats (easy/normal/hard)
# health: 40
# damage: 3-8

# base stat nerf
attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -25 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.14 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 75
scoreboard players set $mob_damage gm4_sr_data 40
scoreboard players set $mob_speed gm4_sr_data 28
