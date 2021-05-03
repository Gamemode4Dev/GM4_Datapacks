# @s = item entity on compressor marked as such by tinkering_compressors:create_check
# at @s
# run from tinkering_compressor:tick

data merge block ~ ~-0.5 ~ {Items:[],CustomName:'{"translate":"%1$s%3427655$s","with":["Tinkering Compressor",{"translate":"block.gm4.tinkering_compressor"}]}'}
data merge entity @s {CustomName:'"gm4_tinkering_compressor"',ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:1,SkullOwner:{Id:[I;690199207,-409122254,-1436298594,1358624862],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWQyZTU2OTkwOTI4ZWM2ZjI1NzY5YTczNjE2M2MxOWFjOTcwNmYyNTM0Y2YwM2FlOWNhMzgyOWY2MzdiYTMwMCJ9fX0="}]}}}}],HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:2}},{}],Pose:{RightArm:[0f, 0f, 0f]}}
kill @e[type=item,sort=nearest,tag=gm4_tc_on_compressor,limit=1,distance=..0.9]
playsound minecraft:entity.firework_rocket.blast block @a[distance=..5]
particle cloud ~ ~ ~ 0.1 0.1 0.1 0.05 10
tag @s remove gm4_block_compressor
tag @s add gm4_tinkering_compressor
advancement grant @a[distance=..5,gamemode=!spectator] only gm4:tinkering_compressors
