#crafter creation
execute as @e[type=item,nbt={Item:{id:"minecraft:crafting_table",Count:1b},OnGround:1b}] at @s if block ~ ~-1 ~ dropper{Items:[{Slot:0b,id:"minecraft:cobblestone",Count:1b},{Slot:1b,id:"minecraft:cobblestone",Count:1b},{Slot:2b,id:"minecraft:cobblestone",Count:1b},{Slot:3b,id:"minecraft:cobblestone",Count:1b},{Slot:5b,id:"minecraft:cobblestone",Count:1b},{Slot:6b,id:"minecraft:cobblestone",Count:1b},{Slot:7b,id:"minecraft:redstone",Count:1b},{Slot:8b,id:"minecraft:cobblestone",Count:1b}]} align xyz positioned ~.5 ~-1 ~.5 unless entity @e[type=armor_stand,tag=gm4_custom_crafter,limit=1,distance=..0.5] run function custom_crafters:create

#crafter destruction
execute as @e[type=armor_stand,tag=gm4_custom_crafter] at @s unless block ~ ~ ~ dropper run function custom_crafters:destroy

#crafter maintenance
execute as @e[tag=gm4_custom_crafter,type=armor_stand] run data merge entity @s {Fire:2000}

#recipes
execute as @e[tag=gm4_custom_crafter,type=armor_stand] at @s if block ~ ~ ~ dropper[triggered=false]{Items:[{}]} run function custom_crafters:recipe_validity_check
