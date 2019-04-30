#run from detection_master_pulse in same folder
#@s = as and at gold nugget named 'key', null enchantment, custom model data 11525

execute if block ~ ~-1 ~ minecraft:stripped_oak_wood as @e[type=minecraft:item_frame, limit=1, sort=nearest, distance=..2, tag=!gm4_sd_drawer, tag=!gm4_sd_empty] at @s run function storage_drawers:all/check_storable
execute as @e[type=minecraft:item_frame, limit=1, sort=nearest, distance=..2, tag=!gm4_sd_drawer, tag=!gm4_sd_empty, scores={gm4_sd_storable=0}] if block ~ ~-1 ~ minecraft:stripped_oak_wood run function storage_drawers:all/create_drawer