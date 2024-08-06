# calculate modifiers for newly spawned creeper
# @s = creeper
# at @s
# run from mob/init/mob_type

# starting stats (easy/normal/hard)
# health: 20
# damage: explosion

# base stat nerf
attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -12 add_value
attribute @s generic.movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.12 add_value

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 20
scoreboard players set $mob_damage gm4_sr_data 0
scoreboard players set $mob_speed gm4_sr_data 27
