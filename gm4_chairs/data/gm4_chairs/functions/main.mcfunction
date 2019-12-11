#saddle item on a stair block -> spawn pig
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:saddle"}}] at @s if block ~ ~ ~ #minecraft:stairs[half=bottom] positioned ~ ~-.1 ~ align xyz unless entity @e[type=pig,tag=gm4_chairs,dx=0,dz=0,dy=0] at @s run function chairs:saddle

#kill pig/saddle if stair block broken
execute as @e[type=pig,tag=gm4_chairs] at @s unless block ~ ~1 ~ #minecraft:stairs run function chairs:kill

#OPTIONAL: position and rotation correction, offset caused by holding a carrot on a stick. Without this line it would still function correctly and you'll be able to rotate the saddle.
execute as @e[type=pig,tag=gm4_chairs] at @s align xyz if entity @p[dx=0,dz=0,dy=1] unless entity @p[nbt={RootVehicle:{Entity:{id:"minecraft:pig"}}}] positioned ~ ~1 ~ run function chairs:correction

#advancement
execute as @a[nbt={RootVehicle:{Entity:{Tags:["gm4_chairs"]}}}] unless score @s gm4_chairs_sit matches 4501.. run scoreboard players add @s gm4_chairs_sit 1
advancement grant @a[scores={gm4_chairs_sit=4500}] only gm4:chairs_sit

schedule function chairs:main 16t
