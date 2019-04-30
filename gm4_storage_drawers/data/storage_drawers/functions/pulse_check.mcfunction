#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = storage_drawers gm4_clock_tick run function storage_drawers:main

execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer] at @s if entity @s[nbt={ItemRotation:1b}] run function storage_drawers:all/drawer_right_clicked

execute as @e[type=item] store result score @s gm4_sd_itm_amnt run data get entity @s Item.Count 1
execute as @e[type=minecraft:player, scores={gm4_sd_sneaking=1..}] run scoreboard players set @s gm4_sd_sneaking 0

execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer] at @s if block ^ ^ ^-1 air run function storage_drawers:all/destroy


