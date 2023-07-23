# @s = obsidian block with count of 1 on top of sand next to a clay ball with a count of 1
# run from check_mould_creation

summon armor_stand ~.45 ~-1.150 ~.65 {CustomName:'"gm4_sand_ring"',Tags:["gm4_sand_ring","gm4_new_sand_ring"],ArmorItems:[{id:"minecraft:stick",Count:1b},{},{},{id:"minecraft:player_head",Count:1,tag:{CustomModelData:3420023,SkullOwner:"$moulds/2"}}],Silent:1,Invulnerable:1,Marker:1b,Invisible:1b,NoGravity:1b,Small:1b,HasVisualFire:1b}

scoreboard players add @e[type=armor_stand,tag=gm4_new_sand_ring] gm4_ml_ore_al 0
scoreboard players add @e[type=armor_stand,tag=gm4_new_sand_ring] gm4_ml_ore_ba 0
scoreboard players add @e[type=armor_stand,tag=gm4_new_sand_ring] gm4_ml_ore_bi 0
scoreboard players add @e[type=armor_stand,tag=gm4_new_sand_ring] gm4_ml_ore_th 0

scoreboard players set @e[type=armor_stand,tag=gm4_new_sand_ring] gm4_ml_heat 30
tag @e[type=armor_stand,tag=gm4_new_sand_ring] remove gm4_new_sand_ring

kill @e[type=item,limit=1,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:clay_ball",Count:1b},OnGround:1b}]
kill @e[type=item,limit=1,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:obsidian",Count:1b},OnGround:1b}]
