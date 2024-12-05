# calculate modifiers for newly spawned silverfish
# @s = silverfish
# at @s
# run from mob/init/mob_type

# Stat Block (normal/hard diff)
# health: 1 - 6
# damage: 1 - 2.5
# speed: 80 - 120%

# base stat nerf
attribute @s max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -7 add_value
attribute @s movement_speed modifier add gm4_survival_refightalized:stat_change.base_nerf -0.2 add_multiplied_total

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 5
scoreboard players set $mob_damage gm4_sr_data 15
scoreboard players set $mob_speed gm4_sr_data 40

# size changes
execute store result score $size_change gm4_sr_data run random value 1..100
# normal (+20% speed)
execute if score $size_change gm4_sr_data matches ..50 run attribute @s movement_speed modifier add gm4_survival_refightalized:stat_change.random_scale 0.2 add_multiplied_total
# medium (+0.25 scale)
execute if score $size_change gm4_sr_data matches 51..75 run attribute @s scale modifier add gm4_survival_refightalized:stat_change.random_scale 0.25 add_value
# large (+0.5 scale, +2 health)
execute if score $size_change gm4_sr_data matches 76..90 run attribute @s scale modifier add gm4_survival_refightalized:stat_change.random_scale 0.5 add_value
execute if score $size_change gm4_sr_data matches 76..90 run attribute @s max_health modifier add gm4_survival_refightalized:stat_change.random_scale 2 add_value
# giant (+0.75 scale, +4 health, +1 damage)
execute if score $size_change gm4_sr_data matches 90..100 run attribute @s scale modifier add gm4_survival_refightalized:stat_change.random_scale 0.75 add_value
execute if score $size_change gm4_sr_data matches 90..100 run attribute @s max_health modifier add gm4_survival_refightalized:stat_change.random_scale 4 add_value
execute if score $size_change gm4_sr_data matches 90..100 run attribute @s attack_damage modifier add gm4_survival_refightalized:stat_change.random_scale 1 add_value
