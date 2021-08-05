# Called from recipe_check

# Change block from Custom Crafter to Trash Can
clone ~ ~1 ~ ~ ~1 ~ ~ ~ ~ replace
setblock ~ ~1 ~ air
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Arborist Analyzer",{"translate":"block.gm4.gv_arborist_analyzer"}]}'}
data merge entity @s {CustomName:'"gm4_gv_arborist_analyzer"',ArmorItems:[{},{},{},{id:"minecraft:green_concrete_powder",Count:1b,tag:{CustomModelData:1}}]}

# get id
execute store result score @s gm4_gv_job_id run data get entity @s UUID[0]

# Visuals
playsound minecraft:block.beehive.enter block @a[distance=..10]

# Change Tag
tag @s add gm4_gv_arborist_analyzer
tag @s remove gm4_custom_crafter
