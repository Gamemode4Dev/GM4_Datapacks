#crafter creation
execute as @e[type=item,nbt={Item:{id:"minecraft:crafting_table",Count:1b},OnGround:1b}] at @s if block ~ ~-1 ~ dropper{Items:[{Slot:0b,id:"minecraft:cobblestone",Count:1b},{Slot:1b,id:"minecraft:cobblestone",Count:1b},{Slot:2b,id:"minecraft:cobblestone",Count:1b},{Slot:3b,id:"minecraft:cobblestone",Count:1b},{Slot:5b,id:"minecraft:cobblestone",Count:1b},{Slot:6b,id:"minecraft:cobblestone",Count:1b},{Slot:7b,id:"minecraft:redstone",Count:1b},{Slot:8b,id:"minecraft:cobblestone",Count:1b}]} align xyz positioned ~ ~-1 ~ unless entity @e[type=armor_stand,tag=gm4_block,limit=1,dx=0,dy=0,dz=0] positioned ~.5 ~0 ~.5 run function gm4_custom_crafters:create

# armor stand calls
execute as @e[type=armor_stand,tag=gm4_custom_crafter] at @s run function gm4_custom_crafters:crafter

schedule function gm4_custom_crafters:main 16t
