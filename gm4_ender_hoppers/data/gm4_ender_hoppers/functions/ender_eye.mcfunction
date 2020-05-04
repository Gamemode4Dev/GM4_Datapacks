#@s = ender_eye item
#run from main

tag @s add gm4_ender_hoppers_checking
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:ender_pearl",Count:2b},{Slot:1b,id:"minecraft:iron_block",Count:2b},{Slot:2b,id:"minecraft:diamond_block",Count:1b},{Slot:3b,id:"minecraft:iron_block",Count:2b},{Slot:4b,id:"minecraft:ender_pearl",Count:2b}]} align xyz unless entity @e[type=armor_stand,tag=gm4_ender_hopper,limit=1,dx=0,dy=0,dz=0] positioned ~0.5 ~0.5 ~0.5 run function gm4_ender_hoppers:create_block
execute unless block ~ ~ ~ hopper as @e[type=hopper_minecart,tag=!gm4_ender_hopper,dx=0,nbt={Items:[{Slot:0b,id:"minecraft:ender_pearl",Count:2b},{Slot:1b,id:"minecraft:iron_block",Count:2b},{Slot:2b,id:"minecraft:diamond_block",Count:1b},{Slot:3b,id:"minecraft:iron_block",Count:2b},{Slot:4b,id:"minecraft:ender_pearl",Count:2b}]}] at @s run function gm4_ender_hoppers:create_cart
tag @s add gm4_ender_hoppers_checked
tag @s remove gm4_ender_hoppers_checking
