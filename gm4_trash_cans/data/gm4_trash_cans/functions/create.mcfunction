# Called from recipe_check
data merge block ~ ~ ~ {Items:[],CustomName:'{"translate":"%1$s%3427655$s","with":["Trash Can",{"translate":"block.gm4.trash_can"}]}'}
data merge entity @s {CustomName:'"gm4_trash_can"',ArmorItems:[{},{},{},{id:"minecraft:magma_block",Count:1b,tag:{CustomModelData:1}}]}
playsound minecraft:block.lava.extinguish block @a[distance=..5]
tag @s add gm4_trash_can
tag @s remove gm4_custom_crafter
advancement grant @a[distance=..3,gamemode=!spectator] only gm4:trash_cans
