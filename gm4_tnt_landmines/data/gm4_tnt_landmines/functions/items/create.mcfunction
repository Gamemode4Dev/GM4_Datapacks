summon armor_stand ~ ~-1 ~ {NoGravity:1b,Small:1b,Invisible:1b,Marker:1b,Invulnerable:1b,Fire:200000,Tags:["gm4_tnt_mine","gm4_no_edit"],DisabledSlots:4144959}
execute if entity @s[nbt={Item:{tag:{gm4_tnt_landmines:{block:"tnt"}}}}] positioned ~ ~-1 ~ run data merge entity @e[type=armor_stand,distance=..0.1,limit=1,tag=gm4_tnt_mine] {ArmorItems:[{},{},{},{id:"tnt",Count:1b}]}
execute if entity @s[nbt={Item:{tag:{gm4_tnt_landmines:{block:"grass"}}}}] positioned ~ ~-1 ~ run data merge entity @e[type=armor_stand,distance=..0.1,limit=1,tag=gm4_tnt_mine] {ArmorItems:[{},{},{},{id:"grass_block",Count:1b}]}
execute if entity @s[nbt={Item:{tag:{gm4_tnt_landmines:{block:"dirt"}}}}] positioned ~ ~-1 ~ run data merge entity @e[type=armor_stand,distance=..0.1,limit=1,tag=gm4_tnt_mine] {ArmorItems:[{},{},{},{id:"dirt",Count:1b}]}
execute if entity @s[nbt={Item:{tag:{gm4_tnt_landmines:{block:"stone"}}}}] positioned ~ ~-1 ~ run data merge entity @e[type=armor_stand,distance=..0.1,limit=1,tag=gm4_tnt_mine] {ArmorItems:[{},{},{},{id:"stone",Count:1b}]}
execute if entity @s[nbt={Item:{tag:{gm4_tnt_landmines:{block:"stone_bricks"}}}}] positioned ~ ~-1 ~ run data merge entity @e[type=armor_stand,distance=..0.1,limit=1,tag=gm4_tnt_mine] {ArmorItems:[{},{},{},{id:"stone_bricks",Count:1b}]}
execute if entity @s[nbt={Item:{tag:{gm4_tnt_landmines:{block:"crafting_table"}}}}] positioned ~ ~-1 ~ run data merge entity @e[type=armor_stand,distance=..0.1,limit=1,tag=gm4_tnt_mine] {ArmorItems:[{},{},{},{id:"crafting_table",Count:1b}]}
execute if entity @s[nbt={Item:{tag:{gm4_tnt_landmines:{block:"netherrack"}}}}] positioned ~ ~-1 ~ run data merge entity @e[type=armor_stand,distance=..0.1,limit=1,tag=gm4_tnt_mine] {ArmorItems:[{},{},{},{id:"netherrack",Count:1b}]}
execute if entity @s[nbt={Item:{tag:{gm4_tnt_landmines:{block:"none"}}}}] positioned ~ ~-1 ~ run data remove entity @e[type=armor_stand,distance=..0.1,limit=1,tag=gm4_tnt_mine] ArmorItems[0]
execute if entity @s[nbt={Item:{tag:{gm4_tnt_landmines:{block:"none"}}}}] positioned ~ ~-1 ~ run tag @e[type=armor_stand,distance=..0.1,limit=1,tag=gm4_tnt_mine] add gm4_mine_invisible
summon area_effect_cloud ~ ~-1 ~ {Duration:60,Tags:["gm4_mine_disarmed"]}
kill @s
