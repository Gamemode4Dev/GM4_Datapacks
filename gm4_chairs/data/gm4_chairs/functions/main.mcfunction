#saddle item on a stair block -> spawn pig
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:saddle"}},tag=!gm4_chairs_ignore] at @s if block ~ ~ ~ #minecraft:stairs[half=bottom] positioned ~ ~-.1 ~ align xyz unless entity @e[type=minecraft:pig,tag=gm4_chairs,dx=0,dz=0,dy=0] at @s run function gm4_chairs:create_chair

#kill pig/saddle if stair block broken
execute as @e[type=minecraft:pig,tag=gm4_chairs] at @s unless block ~ ~1 ~ #minecraft:stairs positioned ~ ~.5 ~ run function gm4_chairs:kill

schedule function gm4_chairs:main 16t
