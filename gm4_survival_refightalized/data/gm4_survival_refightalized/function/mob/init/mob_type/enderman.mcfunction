# calculate modifiers for newly spawned enderman
# @s = enderman
# at @s
# run from mob/init/mob_type

# starting stats (easy/normal/hard)
# health: 40
# damage: 7

# base stat nerf
attribute @s generic.attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -4 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.1 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 15
scoreboard players set $mob_damage gm4_sr_data 70
scoreboard players set $mob_speed gm4_sr_data 36