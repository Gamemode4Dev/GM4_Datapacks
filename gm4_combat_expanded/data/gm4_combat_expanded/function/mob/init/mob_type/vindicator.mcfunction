# calculate modifiers for newly spawned vindicator
# @s = vindicator
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add gm4_combat_expanded:stat_change.base_nerf -4 add_value
attribute @s generic.attack_damage modifier add gm4_combat_expanded:stat_change.base_nerf -3 add_value
attribute @s generic.movement_speed modifier add gm4_combat_expanded:stat_change.base_nerf -0.10 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 15
scoreboard players set $mob_damage gm4_ce_data 45
scoreboard players set $mob_speed gm4_ce_data 30
scoreboard players set $mob_armor gm4_ce_data 14
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 100

execute store result score $wave gm4_ce_data run data get entity @s Wave
execute store result score $patrol_leader gm4_ce_data run data get entity @s PatrolLeader

# | Modifiers
# leader
execute if score $patrol_leader gm4_ce_data matches 1 run scoreboard players add $difficulty gm4_ce_data 10
# raider
scoreboard players set $difficulty_add gm4_ce_data 4
scoreboard players operation $difficulty_add gm4_ce_data *= $wave gm4_ce_data
scoreboard players operation $difficulty gm4_ce_data += $difficulty_add gm4_ce_data

execute if score $wave gm4_ce_data matches 4.. run scoreboard players set $mob_health gm4_ce_data 30
execute if score $wave gm4_ce_data matches 4.. run scoreboard players set $mob_toughness gm4_ce_data 10

# cap difficulty
scoreboard players operation $difficulty gm4_ce_data < #100 gm4_ce_data

# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:weapon/axe/iron

# set droprate to 40%
data modify entity @s HandDropChances set value [0.40F,0.40F]

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
