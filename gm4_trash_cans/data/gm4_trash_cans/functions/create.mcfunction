# Called from recipe_check

# Change block from Custom Crafter to Trash Can
data merge block ~ ~ ~ {Items:[],CustomName:'{"translate":"%1$s%3427655$s","with":["Trash Can",{"translate":"block.gm4.trash_can"}]}'}
data merge entity @s {CustomName:'"gm4_trash_can"',ArmorItems:[{},{},{},{id:"minecraft:magma_block",Count:1b,tag:{CustomModelData:1}}]}

# Visuals
playsound minecraft:block.lava.extinguish block @a[distance=..5]

# Change Tag
tag @s add gm4_trash_can
tag @s remove gm4_custom_crafter

# Give advancement
advancement grant @a[distance=..3,gamemode=!spectator] only gm4:trash_cans
