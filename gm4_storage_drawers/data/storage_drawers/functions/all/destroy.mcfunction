#run from pulse_check
#@s = as and at drawer with base block destroyed

execute if score @s gm4_sd_amount matches 65.. run tag @s add gm4_sd_filled
execute if entity @s[tag=gm4_sd_filled] run setblock ^ ^ ^-1 minecraft:white_bed keep
execute if entity @s[tag=gm4_sd_filled] run title @p[distance=..3] actionbar "Drawer needs 64 items or less before you destroy it!"

execute if entity @s[tag=!gm4_sd_filled] run summon minecraft:item ~ ~ ~ {Item:{id: "minecraft:stone", Count:1b}}
execute if entity @s[tag=!gm4_sd_filled] run data modify entity @e[type=item, limit=1, distance=..1] Item.id set from entity @s Item.id
execute if entity @s[tag=!gm4_sd_filled] run execute store result entity @e[type=item, limit=1, sort=nearest, distance=..3] Item.Count byte 1 run scoreboard players get @s gm4_sd_amount
execute if entity @s[tag=!gm4_sd_filled] run summon minecraft:item ~ ~ ~ {Item:{id: "minecraft:item_frame", Count:1b}}
execute if entity @s[tag=!gm4_sd_filled] run kill @s

tag @s remove gm4_sd_filled