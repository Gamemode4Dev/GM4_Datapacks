#saddle item on a stair block -> spawn pig
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:saddle"}}] at @s if block ~ ~ ~ #minecraft:stairs[half=bottom] positioned ~ ~-1 ~ align xyz unless entity @e[tag=chairs,dx=0,dz=0,dy=0] run function chairs:saddle

#kill pig/saddle if stair block broken 
execute as @e[tag=gm4_chairs] at @s unless block ~ ~1 ~ #minecraft:stairs run function chairs:kill

#OPTIONAL: position and rotation correction, offset caused by holding a carrot on a stick. Without this line it would still function correctly and you'll be able to rotate the saddle.
execute as @e[tag=gm4_chairs] at @s align xyz if entity @p[dx=0,dz=0,dy=2] unless entity @p[nbt={RootVehicle:{Entity:{id:"minecraft:pig"}}}] positioned ~ ~1 ~ run function chairs:correction
