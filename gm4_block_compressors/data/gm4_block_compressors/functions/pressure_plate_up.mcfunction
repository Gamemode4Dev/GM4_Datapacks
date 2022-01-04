# @s = compressor armor stand that needs to be reset
# located at @s
# run from process

tp @s ~ ~0.03 ~
data modify entity @s ArmorItems[3].tag.CustomModelData set value 3420002
tag @s remove gm4_compressor_depressed
tag @e[type=marker,tag=gm4_block_compressor_processing,limit=1] add gm4_compressor_sound
