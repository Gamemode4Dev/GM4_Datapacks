# @s = compressor armor stand that needs to be moved down
# located at @s
# run from process

tp @s ~ ~-0.03 ~
data modify entity @s ArmorItems[3].tag.CustomModelData set value 3420003
tag @s add gm4_compressor_depressed
tag @e[type=marker,tag=gm4_block_compressor_processing,limit=1] remove gm4_compressor_sound
