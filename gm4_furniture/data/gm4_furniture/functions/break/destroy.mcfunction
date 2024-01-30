# destroy this furniture
# @s = furniture main interaction entity
# at @s
# run from break/process_hit
# run from break/lost_connection

# check if furniture had color data
execute store result score $furniture_color gm4_furniture_data positioned ~-0.4999 ~0.0001 ~-0.4999 run data get entity @e[type=item_display,tag=gm4_furniture,dx=0,dy=0,dz=0,limit=1] item.tag.display.color
execute if score $furniture_color gm4_furniture_data matches 16383998 run scoreboard players reset $furniture_color gm4_furniture_data
execute if score $furniture_color gm4_furniture_data matches 1.. run function gm4_furniture:break/decimal_to_hex

# unless breaking player was in creative drop the item
execute unless score $creative gm4_furniture_data matches 1 positioned ~-0.4999 ~0.0001 ~-0.4999 as @e[type=item_display,tag=gm4_furniture.display,dx=0,dy=0,dz=0,limit=1] run function gm4_furniture:break/drop_item with entity @s item.tag.data

# remove any furniture blocks that match the id
execute as @e[type=interaction,tag=gm4_furniture,distance=..8] if score @s gm4_furniture_id = $check_id gm4_furniture_id at @s run function gm4_furniture:break/remove_block

# if the broken furniture was a furniture station run some extra code
execute if entity @s[tag=gm4_furniture.furniture_station] run function gm4_furniture:break/remove_furniture_station

# destroy sound
playsound minecraft:entity.armor_stand.break block @a[distance=..8] ~ ~ ~ 1 1

# cleanup
scoreboard players reset $furniture_color gm4_furniture_data
