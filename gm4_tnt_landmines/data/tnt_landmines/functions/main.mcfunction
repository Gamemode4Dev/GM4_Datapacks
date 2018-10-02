execute as @e[type=item,nbt={OnGround:1b,Item:{id:"minecraft:tnt",Count:1b,tag:{gm4_tnt_landmines:{item:1}}}}] at @s unless entity @e[type=armor_stand,tag=gm4_tnt_mine,distance=..1.5] run function tnt_landmines:create
execute as @e[type=armor_stand,tag=gm4_tnt_mine,tag=!gm4_armed] at @s unless entity @e[type=area_effect_cloud,tag=gm4_mine_disarmed,distance=..0.2] run tag @s add gm4_armed

execute as @e[type=armor_stand,tag=gm4_tnt_mine] run data merge entity @s {Fire:2000}

execute as @e[type=item,nbt={OnGround:1b,Item:{id:"minecraft:shears"}},nbt=!{Item:{tag:{Enchantments:[{lvl:1s,id:"minecraft:silk_touch"}]}}}] at @s at @e[type=armor_stand,tag=gm4_tnt_mine,tag=gm4_armed,distance=..1.2,sort=nearest,limit=1] run function tnt_landmines:disarming_nosilk
execute as @e[type=item,nbt={OnGround:1b,Item:{id:"minecraft:shears",tag:{Enchantments:[{lvl:1s,id:"minecraft:silk_touch"}]}}}] at @s at @e[type=armor_stand,tag=gm4_tnt_mine,tag=gm4_armed,distance=..1.2,sort=nearest,limit=1] run function tnt_landmines:disarming_silk
