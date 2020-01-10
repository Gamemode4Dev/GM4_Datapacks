#ran at all landmines
#@s = landmine
#keep them lit
data merge entity @s {Fire:2000}

#arming (if they are not armed)
execute as @s[tag=!gm4_armed] unless entity @e[type=area_effect_cloud,tag=gm4_mine_disarmed,distance=..0.2] run tag @s add gm4_armed

#upgrading
execute as @s[tag=!gm4_no_damage] as @e[type=item,distance=..1.2,limit=1,nbt={OnGround:1b,Item:{id:"minecraft:gunpowder",Count:1b,tag:{gm4_tnt_landmines:{item:2}}}}] run function gm4_tnt_landmines:items/upgrade

#disarming
execute as @e[type=item,distance=..1.2,sort=nearest,limit=1,nbt={OnGround:1b,Item:{id:"minecraft:shears"}}] run function gm4_tnt_landmines:items/disarming

#show invisible mines
execute as @s[tag=gm4_mine_invisible] if entity @a[nbt={SelectedItem:{id:"minecraft:shears"}},distance=..5] run particle minecraft:mycelium ~ ~1 ~ 0 0.1 0 0.1 20 normal
execute as @s[tag=gm4_mine_invisible] if entity @a[distance=..10] run particle minecraft:mycelium ~ ~1 ~ 0.5 0 0.5 0.1 8 normal
