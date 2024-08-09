# calculate modifiers for newly spawned breeze
# @s = breeze
# at @s
# run from mob/init/mob_type

# starting stats (easy/normal/hard)
# health: 30
# damage: 1

# base stat nerf
attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -12 add_value

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 22
scoreboard players set $mob_damage gm4_sr_data 0
scoreboard players set $mob_speed gm4_sr_data 0
