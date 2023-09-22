# processes the "right click detection" interaction so that it is despawned when unneeded
# run from function: gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/loop

# kill rcd if uneeded
scoreboard players set $killed_rcd gm4_rol_data 0
execute if score $killed_rcd gm4_rol_data matches 0 store success score $killed_rcd gm4_rol_data unless entity @a[tag=gm4_rol_holding_ladder,distance=..5] run kill @s
execute if score $killed_rcd gm4_rol_data matches 0 store success score $killed_rcd gm4_rol_data unless block ~ ~ ~ ladder run kill @s
execute if score $killed_rcd gm4_rol_data matches 0 store success score $killed_rcd gm4_rol_data if block ~ ~-1 ~ ladder unless block ~ ~1 ~ #gm4:air run kill @s
execute if score $killed_rcd gm4_rol_data matches 0 store success score $killed_rcd gm4_rol_data if entity @e[type=interaction,tag=gm4_rol_rcd_ladder,distance=0.1..10] run kill @s
