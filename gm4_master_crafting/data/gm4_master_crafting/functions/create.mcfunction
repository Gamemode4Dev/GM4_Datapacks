# @s = standard custom crafter which needs to be converted into a master crafter
# run from recipe_check
data merge entity @s {CustomName:'"gm4_master_crafter"',ArmorItems:[{},{},{},{id:"minecraft:piston",Count:1b,tag:{CustomModelData:1}}],Pose:{Head:[180f,0f,0f]},Small:0b}
data merge storage gm4_custom_crafters:temp/crafter {CustomName:'{"translate":"%1$s%3427655$s","with":["Mastercraftsman\'s Bench",{"translate":"block.gm4.master_crafter"}]}',Items:[]}
tag @s add gm4_master_crafting

playsound entity.blaze.hurt block @a[distance=..4] ~ ~ ~ 1 0.8 1
