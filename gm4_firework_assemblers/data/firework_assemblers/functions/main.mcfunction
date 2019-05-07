#firework assembler creation
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:crafting_table",Count:1b},OnGround:1b}] at @s if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:flint_and_steel",Count:1b},OnGround:1b},distance=..1] if block ~ ~-1 ~ minecraft:dropper{Items:[{Slot:0b,id:"minecraft:smooth_stone",Count:1b},{Slot:1b,id:"minecraft:firework_rocket",Count:1b},{Slot:2b,id:"minecraft:smooth_stone",Count:1b},{Slot:3b,id:"minecraft:obsidian",Count:1b},{Slot:4b,id:"minecraft:tnt",Count:1b},{Slot:5b,id:"minecraft:obsidian",Count:1b},{Slot:6b,id:"minecraft:smooth_stone",Count:1b},{Slot:7b,id:"minecraft:obsidian",Count:1b},{Slot:8b,id:"minecraft:smooth_stone",Count:1b}]} align xyz unless entity @e[type=minecraft:armor_stand,tag=gm4_firework_assembler,limit=1,dx=0,dy=0,dz=0] positioned ~.5 ~-1 ~.5 run function firework_assemblers:create

#firework assembler crafter destruction
execute as @e[type=minecraft:armor_stand,tag=gm4_firework_assembler] at @s unless block ~ ~ ~ minecraft:dropper run function firework_assemblers:destroy

#firework assembler maintenance
execute as @e[tag=gm4_firework_assembler,type=minecraft:armor_stand] run data merge entity @s {Fire:2000}

#recipes
execute as @e[tag=gm4_firework_assembler,type=minecraft:armor_stand] at @s if block ~ ~ ~ minecraft:dropper[triggered=false]{Items:[{}]} run function firework_assemblers:recipe_validity_check
