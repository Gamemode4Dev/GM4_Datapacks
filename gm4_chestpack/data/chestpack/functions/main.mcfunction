#give the shulker box item entity a tag
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:white_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:orange_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:magenta_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:light_blue_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:yellow_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:lime_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:pink_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:gray_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:light_gray_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:cyan_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:purple_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:blue_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:brown_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:green_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:red_shulker_box"}}] add gm4_shulker_box
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:black_shulker_box"}}] add gm4_shulker_box

#store the amount of items in the shulker box
execute as @e[type=item,tag=gm4_shulker_box] store result score @s gm4_chestpack if data entity @s Item.tag.BlockEntityTag.Items[]

#If this item hasnt been processed, and it is a shulker box
#and it doesnt have items
#and it is on a chest
#and the chest doesnt contain a shulker box
#THEN run load_chestpack
execute as @e[type=item,tag=!gm4_chestpack_processed,tag=gm4_shulker_box] at @s if score @s gm4_chestpack matches 0 if block ~ ~ ~ #chestpack:chest unless data block ~ ~ ~ {Items:[{id:"minecraft:shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:white_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:orange_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:magenta_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:light_blue_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:yellow_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:lime_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:pink_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:gray_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:light_gray_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:cyan_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:purple_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:blue_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:brown_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:green_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:red_shulker_box"}]} unless data block ~ ~ ~ {Items:[{id:"minecraft:black_shulker_box"}]} run function chestpack:load_chestpack
execute as @e[type=item,tag=gm4_shulker_box,tag=!gm4_chestpack_processed,tag=!gm4_chestpack_failed] at @s if block ~ ~ ~ #chestpack:chest run function chestpack:failed