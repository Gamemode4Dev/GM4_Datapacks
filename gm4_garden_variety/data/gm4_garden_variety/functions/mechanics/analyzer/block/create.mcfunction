# Called from recipe_check

# convert block
data merge storage gm4_custom_crafters:temp/crafter {CustomName:'{"translate":"%1$s%3427655$s","with":["Arborist Analyzer",{"translate":"block.gm4.gv_arborist_analyzer"}]}'}
data merge entity @s {CustomName:'"gm4_gv_analyzer"',ArmorItems:[{},{},{},{id:"minecraft:green_concrete_powder",Count:1b,tag:{CustomModelData:1}}]}

# copy block
clone ~ ~1 ~ ~ ~1 ~ ~ ~ ~ replace
setblock ~ ~1 ~ air

# get id
execute store result score @s gm4_gv_job_id run data get entity @s UUID[0]

# Visuals
playsound minecraft:block.beehive.enter block @a[distance=..10]

# Change Tag
tag @s add gm4_gv_analyzer
tag @s remove gm4_custom_crafter
