# processes the rcd interaction so that it is despawned when unneeded
# @s = gm4_rol_rcd_ladder interaction
# at @s
# run from function: gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/loop

scoreboard players set $rcd_found gm4_rol_data 1

# kill rcd if uneeded
execute unless entity @p[tag=gm4_rol_holding_ladder,distance=..5] run return run kill @s
execute unless block ~ ~ ~ ladder run return run kill @s
execute if block ~ ~-1 ~ ladder unless block ~ ~1 ~ #minecraft:air run return run kill @s

# kill if multiple interaction with the same id, which therefore belong to the same player
scoreboard players set $duplicate_exists gm4_rol_data 0
scoreboard players operation $check_id gm4_rol_id = @s gm4_rol_id
execute as @e[type=interaction,tag=gm4_rol_rcd_ladder,distance=0.1..16] if score @s gm4_rol_id = $check_id gm4_rol_id run scoreboard players set $duplicate_exists gm4_rol_data 1
execute if score $duplicate_exists gm4_rol_data matches 1 run kill @s
