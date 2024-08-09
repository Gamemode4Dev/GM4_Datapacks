# calculate modifiers for newly spawned guardian
# @s = guardian
# at @s
# run from mob/init/mob_type

# starting stats (easy/normal/hard)
# health: 30
# damage: 6

# base stat nerf
attribute @s generic.attack_damage modifier add gm4_survival_refightalized:stat_change.base_nerf -4 add_value

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 0
scoreboard players set $mob_damage gm4_sr_data 60
scoreboard players set $mob_speed gm4_sr_data 0
