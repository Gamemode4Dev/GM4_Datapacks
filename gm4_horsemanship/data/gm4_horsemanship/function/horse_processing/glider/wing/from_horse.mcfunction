
execute store result score $horse_yaw gm4_horse_data run data get entity @s Rotation[0] 100
execute on passengers if entity @s[type=item_display,tag=gm4_horse.glider_wing] run function gm4_horsemanship:horse_processing/glider/wing/update
