#run from main

execute as @e[type=minecraft:item_frame, tag=!gm4_sd_empty, nbt=!{Item:{}}] run function storage_drawers:all/empty_item_frame
execute as @e[type=item, tag=!gm4_sd_key, nbt={Item: {id: "minecraft:gold_nugget", Count:1b, tag: {CustomModelData:11525, display: {Name: '{"text":"Key"}'}, Enchantments: [{id: ""}]}}}] at @s run tag @s add gm4_sd_key
execute as @e[type=item, tag=gm4_sd_key] at @s run function storage_drawers:all/key
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer] at @s if entity @e[type=item, distance=..1, limit=1, sort=nearest] if score @s gm4_sd_amount < @s gm4_sd_max run function storage_drawers:all/drawer_add_item

#Display amount
execute at @a[scores={gm4_sd_sneaking=1..}] as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, sort=nearest] at @s run function storage_drawers:all/display_amount

#Hoppers
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, nbt=!{Facing:1b}] at @s if score @s gm4_sd_amount < @s gm4_sd_max positioned ^ ^ ^-2 if block ~ ~ ~ minecraft:hopper[enabled=true]{Items:[{}]} unless block ~ ~ ~ minecraft:hopper[facing=down] run function storage_drawers:all/drawer_add_item_hopper
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer] at @s if score @s gm4_sd_amount < @s gm4_sd_max positioned ^1 ^ ^-1 if block ~ ~ ~ minecraft:hopper[enabled=true]{Items:[{}]} unless block ~ ~ ~ minecraft:hopper[facing=down] run function storage_drawers:all/drawer_add_item_hopper
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer] at @s if score @s gm4_sd_amount < @s gm4_sd_max positioned ^-1 ^ ^-1 if block ~ ~ ~ minecraft:hopper[enabled=true]{Items:[{}]} unless block ~ ~ ~ minecraft:hopper[facing=down] run function storage_drawers:all/drawer_add_item_hopper
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, nbt=!{Facing:1b}] at @s if score @s gm4_sd_amount < @s gm4_sd_max positioned ^ ^1 ^-1 if block ~ ~ ~ minecraft:hopper[enabled=true]{Items:[{}]} if block ~ ~ ~ minecraft:hopper[facing=down] run function storage_drawers:all/drawer_add_item_hopper
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, nbt={Facing:1b}] at @s if score @s gm4_sd_amount < @s gm4_sd_max positioned ^ ^1 ^-1 if block ~ ~ ~ minecraft:hopper[enabled=true]{Items:[{}]} unless block ~ ~ ~ minecraft:hopper[facing=down] run function storage_drawers:all/drawer_add_item_hopper
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, nbt={Facing:1b}] at @s if score @s gm4_sd_amount < @s gm4_sd_max positioned ^ ^-1 ^-1 if block ~ ~ ~ minecraft:hopper[enabled=true]{Items:[{}]} unless block ~ ~ ~ minecraft:hopper[facing=down] run function storage_drawers:all/drawer_add_item_hopper
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer] at @s if score @s gm4_sd_amount < @s gm4_sd_max positioned ^ ^-1 ^-1 if block ~ ~ ~ minecraft:hopper[enabled=true]{Items:[]} run function storage_drawers:all/give_hopper_single

#Upgrades
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, scores={gm4_sd_upgrade=0}] at @s if entity @e[type=item, limit=1, sort=nearest, distance=..1, nbt={Item: {Count:1b, tag: {CustomModelData:1920155, display: {Name: '{"text":"Storage Upgrade: Stone"}'}}}}] run function storage_drawers:all/upgrade_stone
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, scores={gm4_sd_upgrade=1}] at @s if entity @e[type=item, limit=1, sort=nearest, distance=..1, nbt={Item: {Count:1b, tag: {CustomModelData:9181514, display: {Name: '{"text":"Storage Upgrade: Iron"}'}}}}] run function storage_drawers:all/upgrade_iron
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, scores={gm4_sd_upgrade=2}] at @s if entity @e[type=item, limit=1, sort=nearest, distance=..1, nbt={Item: {Count:1b, tag: {CustomModelData:715124, display: {Name: '{"text":"Storage Upgrade: Gold"}'}}}}] run function storage_drawers:all/upgrade_gold
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, scores={gm4_sd_upgrade=3}] at @s if entity @e[type=item, limit=1, sort=nearest, distance=..1, nbt={Item: {Count:1b, tag: {CustomModelData:4911315144, display: {Name: '{"text":"Storage Upgrade: Diamond"}'}}}}] run function storage_drawers:all/upgrade_diamond
execute as @e[type=minecraft:item_frame, tag=gm4_sd_drawer, scores={gm4_sd_upgrade=4}] at @s if entity @e[type=item, limit=1, sort=nearest, distance=..1, nbt={Item: {Count:1b, tag: {CustomModelData:5135181124, display: {Name: '{"text":"Storage Upgrade: Emerald"}'}}}}] run function storage_drawers:all/upgrade_emerald

execute as @e[type=minecraft:item_frame, tag=gm4_sd_empty] run tag @s remove gm4_sd_empty