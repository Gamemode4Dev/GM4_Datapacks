execute as @e[type=item,nbt={Item:{id:"minecraft:ender_eye",Count:1b},OnGround:1b}] at @s if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:ender_pearl",Count:2b},{Slot:1b,id:"minecraft:iron_block",Count:2b},{Slot:2b,id:"minecraft:diamond_block",Count:1b},{Slot:3b,id:"minecraft:iron_block",Count:2b},{Slot:4b,id:"minecraft:ender_pearl",Count:2b}]} align xyz unless entity @e[type=armor_stand,tag=gm4_ender_hopper,limit=1,dx=1,dy=1,dz=1] positioned ~0.5 ~0.5 ~0.5 run function ender_hoppers:create

execute as @e[type=armor_stand,tag=gm4_ender_hopper] at @s run function ender_hoppers:update
