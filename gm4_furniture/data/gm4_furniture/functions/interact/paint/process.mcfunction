
scoreboard players set $interaction_processed gm4_furniture_data 1

scoreboard players operation $check_id gm4_furniture_id = @s gm4_furniture_id
execute as @e[type=interaction,tag=gm4_furniture.main,distance=..8] if score @s gm4_furniture_id = $check_id gm4_furniture_id at @s positioned ~-0.4999 ~0.0001 ~-0.4999 as @e[type=item_display,tag=gm4_furniture,dx=0,dy=0,dz=0,limit=1] store success score $paint_changed gm4_furniture_data run data modify entity @s item.tag.display.color set from storage gm4_furniture:temp color
data remove entity @s interaction

execute if score $paint_changed gm4_furniture_data matches 1 run playsound item.dye.use player @a[distance=..8] ~ ~ ~ 1 1
