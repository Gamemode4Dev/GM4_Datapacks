# calculate modifiers for newly spawned ravager
# @s = ravager
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add gm4_combat_expanded:stat_change.base_nerf -20 add_value
attribute @s generic.attack_damage modifier add gm4_combat_expanded:stat_change.base_nerf 3 add_value
attribute @s generic.movement_speed modifier add gm4_combat_expanded:stat_change.base_nerf -0.1 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 70
scoreboard players set $mob_damage gm4_ce_data 45
scoreboard players set $mob_speed gm4_ce_data 22
scoreboard players set $mob_armor gm4_ce_data 10
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 195

execute store result score $wave gm4_ce_data run data get entity @s Wave

# | Modifiers
# raider
scoreboard players set $difficulty_add gm4_ce_data 4
scoreboard players operation $difficulty_add gm4_ce_data *= $wave gm4_ce_data
scoreboard players operation $difficulty gm4_ce_data += $difficulty_add gm4_ce_data

# cap difficulty
scoreboard players operation $difficulty gm4_ce_data < #100 gm4_ce_data

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
