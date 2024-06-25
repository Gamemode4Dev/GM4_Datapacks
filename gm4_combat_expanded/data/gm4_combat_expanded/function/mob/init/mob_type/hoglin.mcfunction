# calculate modifiers for newly spawned hoglin / zoglin
# @s = hoglin / zoglin
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add gm4_combat_expanded:stat_change.base_nerf -16 add_value
attribute @s generic.movement_speed modifier add gm4_combat_expanded:stat_change.base_nerf -0.14 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 65
scoreboard players set $mob_damage gm4_ce_data 40
scoreboard players set $mob_speed gm4_ce_data 18
scoreboard players set $mob_armor gm4_ce_data 10
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 160

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
