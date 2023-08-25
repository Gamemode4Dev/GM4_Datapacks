
execute if score $creative gm4_furniture_data matches 0 positioned ~-0.4999 ~0.0001 ~-0.4999 as @e[type=item_display,tag=gm4_furniture,dx=0,dy=0,dz=0,limit=1] run function gm4_furniture:break/drop_item with entity @s item.tag.data

execute as @e[type=interaction,tag=gm4_furniture,distance=..8] if score @s gm4_furniture_id = $check_id gm4_furniture_id at @s run function gm4_furniture:break/remove_block
playsound minecraft:entity.armor_stand.break block @a[distance=..8] ~ ~ ~ 1 1
