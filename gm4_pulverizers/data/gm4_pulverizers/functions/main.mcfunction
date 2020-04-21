#pulverizer creation
execute as @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe",Count:1b},OnGround:1b}] at @s if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:iron_block",Count:1b},{Slot:1b,id:"minecraft:piston",Count:1b},{Slot:2b,id:"minecraft:redstone_block",Count:1b},{Slot:3b,id:"minecraft:piston",Count:1b},{Slot:4b,id:"minecraft:iron_block",Count:1b}]} align xyz positioned ~.5 ~ ~.5 unless entity @e[type=armor_stand,tag=gm4_pulverizer,distance=..0.5] run function gm4_pulverizers:create

#pulverizer destruction
execute as @e[type=armor_stand,tag=gm4_pulverizer] at @s unless block ~ ~ ~ hopper run function gm4_pulverizers:destroy

#recipes
execute as @e[type=armor_stand,tag=gm4_pulverizer] at @s if block ~ ~ ~ hopper[enabled=true]{Items:[{Slot:0b}]} unless data block ~ ~ ~ Items[4] run function gm4_pulverizers:pulverize_validity_check

schedule function gm4_pulverizers:main 16t
