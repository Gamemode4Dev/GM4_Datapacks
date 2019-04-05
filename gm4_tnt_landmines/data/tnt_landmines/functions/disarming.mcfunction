#@s = valid pair of shears close enought to a tnt landmine
#particle
execute positioned ~ ~1 ~ run particle minecraft:explosion

#return item
execute if entity @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1,nbt={ArmorItems:[{},{},{},{id:"minecraft:tnt",Count:1b}]}] run summon item ~ ~1 ~ {Motion:[0.0,0.4,0.0],Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:ba205b33-c294-40c6-a17c-068cfd9c7a1c}}}}
execute if entity @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1,nbt={ArmorItems:[{},{},{},{id:"minecraft:grass_block",Count:1b}]}] run summon item ~ ~1 ~ {Motion:[0.0,0.4,0.0],Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:3810590c-6484-4133-b456-a3fc378a39a3}}}}
execute if entity @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1,nbt={ArmorItems:[{},{},{},{id:"minecraft:dirt",Count:1b}]}] run summon item ~ ~1 ~ {Motion:[0.0,0.4,0.0],Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:da309950-dcbc-43f2-880e-3820cffea8ca}}}}
execute if entity @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1,nbt={ArmorItems:[{},{},{},{id:"minecraft:stone",Count:1b}]}] run summon item ~ ~1 ~ {Motion:[0.0,0.4,0.0],Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:ec0d8396-3a18-4298-842c-de978a5ee5c6}}}}
execute if entity @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1,nbt={ArmorItems:[{},{},{},{id:"minecraft:stone_bricks",Count:1b}]}] run summon item ~ ~1 ~ {Motion:[0.0,0.4,0.0],Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:2bedd9c9-b534-4c25-992a-2c5acfaac23f}}}}
execute if entity @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1,nbt={ArmorItems:[{},{},{},{id:"minecraft:crafting_table",Count:1b}]}] run summon item ~ ~1 ~ {Motion:[0.0,0.4,0.0],Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:cabe7f2a-8a06-40e3-a089-f442a1c93902}}}}
execute if entity @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1,nbt={ArmorItems:[{},{},{},{id:"minecraft:netherrack",Count:1b}]}] run summon item ~ ~1 ~ {Motion:[0.0,0.4,0.0],Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"b3a65b75-cbb1-435e-bebf-53d119587934"}}}}
execute if entity @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1,tag=gm4_mine_invisible] run summon item ~ ~1 ~ {Motion:[0.0,0.4,0.0],Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:6fb6cb4a-b13a-4610-ad26-6d54ba77360b}}}}

#kill stand
kill @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1]

#remove durability from shears
execute store result score @s gm4_tnt_cals run data get entity @s Item.tag.Damage
scoreboard players add @s gm4_tnt_cals 1
execute store result entity @s Item.tag.Damage int 1 run scoreboard players get @s gm4_tnt_cals
execute if score @s gm4_tnt_cals matches 238 run kill @s
