# calculate modifiers for newly spawned cave spider
# @s = cave spider
# at @s
# run from mob/init/mob_type

# starting stats (easy/normal/hard)
# health: 12
# damage: 2

# base stat nerf
attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -8 add_value
attribute @s generic.attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -1.5 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.12 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 10
scoreboard players set $mob_damage gm4_sr_data 0
scoreboard players set $mob_speed gm4_sr_data 42
