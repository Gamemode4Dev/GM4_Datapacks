# calculate modifiers for newly spawned evoker
# @s = evoker
# at @s
# run from mob/init/difficulty/check_type

execute store result score $wave gm4_ce_data run data get entity @s Wave
execute store result score $patrol_leader gm4_ce_data run data get entity @s PatrolLeader

# | Modifiers
# leader
execute if score $patrol_leader gm4_ce_data matches 1 run scoreboard players add $difficulty gm4_ce_data 10
# raider
scoreboard players set $difficulty_add gm4_ce_data 4
scoreboard players operation $difficulty_add gm4_ce_data *= $wave gm4_ce_data
scoreboard players operation $difficulty gm4_ce_data += $difficulty_add gm4_ce_data

