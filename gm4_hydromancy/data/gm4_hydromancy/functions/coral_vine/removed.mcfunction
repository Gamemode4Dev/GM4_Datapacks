# remove this coral vine block
# @s = coral vine
# at @s
# run from tick

# vfx
particle block mangrove_roots ~ ~ ~ 0.2 0.2 0.2 0.1 8
playsound block.mangrove_roots.break block @a ~ ~ ~ 1 0.7

# delete item
execute if entity @s[tag=!gm4_hy_coral_vine.alive] run kill @e[type=item,nbt={Item:{id:"minecraft:mangrove_roots"},Age:0s},distance=..1,limit=1,sort=nearest]
execute if entity @s[tag=gm4_hy_coral_vine.alive,tag=!gm4_hy_coral_vine.flowering] run kill @e[type=item,nbt={Item:{id:"minecraft:azalea_leaves"},Age:0s},distance=..1,limit=1,sort=nearest]
execute if entity @s[tag=gm4_hy_coral_vine.alive,tag=gm4_hy_coral_vine.flowering] run kill @e[type=item,nbt={Item:{id:"minecraft:flowering_azalea_leaves"},Age:0s},distance=..1,limit=1,sort=nearest]
execute if entity @s[tag=gm4_hy_coral_vine.alive,tag=gm4_hy_coral_vine.flowering] align xyz run kill @e[type=block_display,tag=gm4_hy_coral_flower,dx=0,dy=0,dz=0]
kill @s

# check connection of the vine
execute positioned ~-7.5 ~-6.5 ~-7.5 as @e[type=item_display,tag=gm4_hy_coral_core,dx=14,dy=7,dz=14] at @s positioned ~-7.5 ~-1.5 ~-7.5 run function gm4_hydromancy:coral_vine/check_connection
