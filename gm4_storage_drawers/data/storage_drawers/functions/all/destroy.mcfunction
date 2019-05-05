#run from destroy_check and itself if drawer amount != 0
#@s = as and at drawer with base block destroyed and amount stored <= 2304

execute if entity @s[scores={gm4_sd_amount=64..}] run summon minecraft:item ^ ^ ^0.1 {Item:{id: "minecraft:stone", Count:64b}, Tags:["gm4_sd_storing_id"]}
execute if entity @s[scores={gm4_sd_amount=64..}] run scoreboard players remove @s gm4_sd_amount 64
execute if entity @s[scores={gm4_sd_amount=..63}] run summon minecraft:item ^ ^ ^0.1 {Item:{id: "minecraft:stone", Count:1b}, Tags:["gm4_sd_storing_id", "gm4_sd_storing_amount"]}

data modify entity @e[type=item, limit=1, distance=..1, tag=gm4_sd_storing_id] Item.id set from entity @s Item.id
tag @e[type=minecraft:item, distance=..1, nbt={Age:0s}] remove gm4_sd_storing_id

execute if entity @s[scores={gm4_sd_amount=..63}] store result entity @e[type=item, limit=1, sort=nearest, distance=..3, tag=gm4_sd_storing_amount] Item.Count byte 1 run scoreboard players get @s gm4_sd_amount

execute if entity @s[scores={gm4_sd_amount=0..63}] run summon minecraft:item ~ ~ ~ {Item:{id: "minecraft:item_frame", Count:1b}}
execute if entity @s[scores={gm4_sd_amount=0..63}] run kill @s
execute if entity @s[scores={gm4_sd_amount=64..}] run function storage_drawers:all/destroy