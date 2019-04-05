#creation
execute as @e[type=item,nbt={OnGround:1b,Item:{id:"minecraft:player_head",Count:1b,tag:{gm4_tnt_landmines:{item:1}}}},tag=!gm4_mine_safe] at @s unless entity @e[type=armor_stand,tag=gm4_tnt_mine,distance=..1.5] unless entity @e[type=item,nbt={OnGround:1b,Item:{id:"minecraft:player_head",Count:1b,tag:{gm4_tnt_landmines:{item:1}}}},distance=0.1..1.5] run function tnt_landmines:create
execute as @e[type=armor_stand,tag=gm4_tnt_mine,tag=!gm4_armed] at @s unless entity @e[type=area_effect_cloud,tag=gm4_mine_disarmed,distance=..0.2] run tag @s add gm4_armed

#upgrading
execute as @e[type=item,nbt={OnGround:1b,Item:{id:"minecraft:gunpowder",Count:1b,tag:{gm4_tnt_landmines:{item:2}}}}] at @s unless entity @e[type=item,nbt={OnGround:1b,Item:{id:"minecraft:gunpowder",Count:1b,tag:{gm4_tnt_landmines:{item:2}}}},distance=0.1..1.1] at @e[type=armor_stand,tag=gm4_tnt_mine,distance=..1.2,limit=1,tag=!gm4_no_damage] unless entity @e[type=area_effect_cloud,tag=gm4_mine_disarmed,distance=..0.2] run function tnt_landmines:upgrade

#stop them from going dark
execute as @e[type=armor_stand,tag=gm4_tnt_mine] run data merge entity @s {Fire:2000}

#disarming
execute as @e[type=item,nbt={OnGround:1b,Item:{id:"minecraft:shears"}}] at @s at @e[type=armor_stand,tag=gm4_tnt_mine,tag=gm4_armed,distance=..1.2,sort=nearest,limit=1] run function tnt_landmines:disarming

#show invisible mines
execute as @a[nbt={SelectedItem:{id:"minecraft:shears"}}] at @s at @e[type=armor_stand,tag=gm4_tnt_mine,tag=gm4_mine_invisible,distance=..5] run particle minecraft:mycelium ~ ~1 ~ 0 0.1 0 1 20 normal
execute at @r as @e[type=armor_stand,tag=gm4_tnt_mine,tag=gm4_mine_invisible,distance=..8] at @s run particle minecraft:mycelium ~ ~1 ~ 0.5 0 0.5 1 6 normal

#fix landmine items
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"ba205b33-c294-40c6-a17c-068cfd9c7a1c"}}}},nbt=!{Item:{tag:{gm4_tnt_landmines:{item:1}}}}] run tag @s add gm4_mine_safe
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"3810590c-6484-4133-b456-a3fc378a39a3"}}}},nbt=!{Item:{tag:{gm4_tnt_landmines:{item:1}}}}] run tag @s add gm4_mine_safe
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"da309950-dcbc-43f2-880e-3820cffea8ca"}}}},nbt=!{Item:{tag:{gm4_tnt_landmines:{item:1}}}}] run tag @s add gm4_mine_safe
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"ec0d8396-3a18-4298-842c-de978a5ee5c6"}}}},nbt=!{Item:{tag:{gm4_tnt_landmines:{item:1}}}}] run tag @s add gm4_mine_safe
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"2bedd9c9-b534-4c25-992a-2c5acfaac23f"}}}},nbt=!{Item:{tag:{gm4_tnt_landmines:{item:1}}}}] run tag @s add gm4_mine_safe
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"cabe7f2a-8a06-40e3-a089-f442a1c93902"}}}},nbt=!{Item:{tag:{gm4_tnt_landmines:{item:1}}}}] run tag @s add gm4_mine_safe
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"b3a65b75-cbb1-435e-bebf-53d119587934"}}}},nbt=!{Item:{tag:{gm4_tnt_landmines:{item:1}}}}] run tag @s add gm4_mine_safe
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"6fb6cb4a-b13a-4610-ad26-6d54ba77360b"}}}},nbt=!{Item:{tag:{gm4_tnt_landmines:{item:1}}}}] run tag @s add gm4_mine_safe

execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"ba205b33-c294-40c6-a17c-068cfd9c7a1c"}}}}] run data merge entity @s {Item:{tag:{gm4_tnt_landmines:{item:1,block:"tnt"},display:{Name:"{\"text\":\"Landmine\"}",Lore:["Drop to use"]}}}}
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"3810590c-6484-4133-b456-a3fc378a39a3"}}}}] run data merge entity @s {Item:{tag:{gm4_tnt_landmines:{item:1,block:"grass"},display:{Name:"{\"text\":\"Landmine\"}",Lore:["Drop to use","Disguised as a grass block"]}}}}
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"da309950-dcbc-43f2-880e-3820cffea8ca"}}}}] run data merge entity @s {Item:{tag:{gm4_tnt_landmines:{item:1,block:"dirt"},display:{Name:"{\"text\":\"Landmine\"}",Lore:["Drop to use","Disguised as dirt"]}}}}
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"ec0d8396-3a18-4298-842c-de978a5ee5c6"}}}}] run data merge entity @s {Item:{tag:{gm4_tnt_landmines:{item:1,block:"stone"},display:{Name:"{\"text\":\"Landmine\"}",Lore:["Drop to use","Disguised as stone"]}}}}
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"2bedd9c9-b534-4c25-992a-2c5acfaac23f"}}}}] run data merge entity @s {Item:{tag:{gm4_tnt_landmines:{item:1,block:"stone_bricks"},display:{Name:"{\"text\":\"Landmine\"}",Lore:["Drop to use","Disguised as stone bricks"]}}}}
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"cabe7f2a-8a06-40e3-a089-f442a1c93902"}}}}] run data merge entity @s {Item:{tag:{gm4_tnt_landmines:{item:1,block:"crafting_table"},display:{Name:"{\"text\":\"Landmine\"}",Lore:["Drop to use","Disguised as a crafting table"]}}}}
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"b3a65b75-cbb1-435e-bebf-53d119587934"}}}}] run data merge entity @s {Item:{tag:{gm4_tnt_landmines:{item:1,block:"netherrack"},display:{Name:"{\"text\":\"Landmine\"}",Lore:["Drop to use","Disguised as netherrack"]}}}}
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"6fb6cb4a-b13a-4610-ad26-6d54ba77360b"}}}}] run data merge entity @s {Item:{tag:{gm4_tnt_landmines:{item:1,block:"none"},display:{Name:"{\"text\":\"Landmine\"}",Lore:["Drop to use","Insivble so dont forget its there!"]}}}}
