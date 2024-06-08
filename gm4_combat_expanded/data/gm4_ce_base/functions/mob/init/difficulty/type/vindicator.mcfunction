# calculate modifiers for newly spawned vindicator
# @s = vindicator
# at @s
# run from mob/init/difficulty/check_type

# get data
execute store result score $wave gm4_ce_data run data get entity @s Wave
execute store result score $patrol_leader gm4_ce_data run data get entity @s PatrolLeader

# leader
execute if score $patrol_leader gm4_ce_data matches 1 run scoreboard players add $difficulty gm4_ce_data 10
# raider
scoreboard players set $difficulty_add gm4_ce_data 4
scoreboard players operation $difficulty_add gm4_ce_data *= $wave gm4_ce_data
scoreboard players operation $difficulty gm4_ce_data += $difficulty_add gm4_ce_data

execute if score $wave gm4_ce_data matches 4.. run scoreboard players set $mob_health gm4_ce_data 30
execute if score $wave gm4_ce_data matches 4.. run scoreboard players set $mob_toughness gm4_ce_data 10
