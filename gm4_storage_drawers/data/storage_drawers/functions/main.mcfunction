execute as @e[type=minecraft:item_frame, tag=!gm4_sd_empty, nbt=!{Item:{}}] run tag @s add gm4_sd_empty
execute as @e[type=item, tag=!gm4_sd_key, nbt={gm4_storage_drawers_key:1b}] at @s run tag @s add gm4_sd_key
execute as @e[type=item, tag=!gm4_sd_key, nbt={gm4_storage_drawers_upgrade_stone:1b}] at @s run tag @s add gm4_sd_upgrade_stone
execute as @e[type=item, tag=!gm4_sd_key, nbt={gm4_storage_drawers_upgrade_iron:1b}] at @s run tag @s add gm4_sd_upgrade_iron
execute as @e[type=item, tag=!gm4_sd_key, nbt={gm4_storage_drawers_upgrade_gold:1b}] at @s run tag @s add gm4_sd_upgrade_gold
execute as @e[type=item, tag=!gm4_sd_key, nbt={gm4_storage_drawers_upgrade_diamond:1b}] at @s run tag @s add gm4_sd_upgrade_diamond
execute as @e[type=item, tag=!gm4_sd_key, nbt={gm4_storage_drawers_upgrade_emerald:1b}] at @s run tag @s add gm4_sd_upgrade_emerald
execute as @e[type=item, tag=gm4_sd_key] at @s run function storage_drawers:all/key
execute at @e[type=minecraft:item_frame, tag=gm4_sd_drawer] as @e[type=item, distance=..5] store result score @s gm4_sd_itm_amnt run data get entity @s Item.Count 1
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer] at @s if entity @e[type=item, distance=..1, limit=1, sort=nearest] if score @s gm4_sd_amount < @s gm4_sd_max run function storage_drawers:all/drawer_add_item

#Display amount
execute at @a[scores={gm4_sd_sneaking=1..}] as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, sort=nearest] at @s run function storage_drawers:all/display_amount

#Hoppers
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, nbt=!{Facing:1b}] at @s if score @s gm4_sd_amount < @s gm4_sd_max positioned ^ ^ ^-2 if block ~ ~ ~ minecraft:hopper[enabled=true]{Items:[{}]} unless block ~ ~ ~ minecraft:hopper[facing=down] run function storage_drawers:all/drawer_compare_hopper
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer] at @s if score @s gm4_sd_amount < @s gm4_sd_max positioned ^1 ^ ^-1 if block ~ ~ ~ minecraft:hopper[enabled=true]{Items:[{}]} unless block ~ ~ ~ minecraft:hopper[facing=down] run function storage_drawers:all/drawer_compare_hopper
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer] at @s if score @s gm4_sd_amount < @s gm4_sd_max positioned ^-1 ^ ^-1 if block ~ ~ ~ minecraft:hopper[enabled=true]{Items:[{}]} unless block ~ ~ ~ minecraft:hopper[facing=down] run function storage_drawers:all/drawer_compare_hopper
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, nbt=!{Facing:1b}] at @s if score @s gm4_sd_amount < @s gm4_sd_max positioned ^ ^1 ^-1 if block ~ ~ ~ minecraft:hopper[enabled=true]{Items:[{}]} if block ~ ~ ~ minecraft:hopper[facing=down] run function storage_drawers:all/drawer_compare_hopper
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, nbt={Facing:1b}] at @s if score @s gm4_sd_amount < @s gm4_sd_max positioned ^ ^1 ^-1 if block ~ ~ ~ minecraft:hopper[enabled=true]{Items:[{}]} unless block ~ ~ ~ minecraft:hopper[facing=down] run function storage_drawers:all/drawer_compare_hopper
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, nbt={Facing:1b}] at @s if score @s gm4_sd_amount < @s gm4_sd_max positioned ^ ^-1 ^-1 if block ~ ~ ~ minecraft:hopper[enabled=true]{Items:[{}]} unless block ~ ~ ~ minecraft:hopper[facing=down] run function storage_drawers:all/drawer_compare_hopper
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer] at @s if score @s gm4_sd_amount < @s gm4_sd_max positioned ^ ^-1 ^-1 if block ~ ~ ~ minecraft:hopper[enabled=true]{Items:[]} run function storage_drawers:all/give_hopper_single

#Upgrades
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, scores={gm4_sd_upgrade=0..4}] at @s run function storage_drawers:all/upgrade_check

#Removes tag
execute as @e[type=minecraft:item_frame, tag=gm4_sd_empty] run tag @s remove gm4_sd_empty