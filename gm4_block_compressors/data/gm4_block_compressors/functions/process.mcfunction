# @s = block compressor
# located at @s
# run from main

tag @s add gm4_block_compressor_processing
execute positioned ~ ~-0.98 ~ run tag @e[type=armor_stand,tag=gm4_block_compressor_stand,limit=1,distance=..0.1] add gm4_block_compressor_processing
execute positioned ~-0.5 ~0.5 ~-0.5 as @e[type=item,dx=0] positioned ~0.5 ~-0.9 ~0.5 run function gm4_block_compressors:item
particle portal ~ ~0.7 ~ 0 0 0 0.1 20

# simulate pressure plate
execute positioned ~ ~-0.995 ~ as @e[type=armor_stand,tag=gm4_block_compressor_stand,tag=gm4_compressor_depressed,distance=..0.01,limit=1] positioned ~-0.5 ~1.495 ~-0.5 unless entity @e[dx=0] at @s run function gm4_block_compressors:pressure_plate_up
execute positioned ~-0.5 ~0.5 ~-0.5 if entity @e[dx=0] positioned ~0.5 ~-1.465 ~0.5 as @e[type=armor_stand,tag=gm4_block_compressor_stand,tag=!gm4_compressor_depressed,distance=..0.01,limit=1] at @s run function gm4_block_compressors:pressure_plate_down
execute if entity @s[tag=gm4_compressor_sound] run playsound block.stone_pressure_plate.click_on block @a[distance=..6] ~ ~0.35 ~ 0.7 0.6

# clean up
tag @s remove gm4_compressor_sound
tag @s remove gm4_block_compressor_processing
tag @e[type=armor_stand,distance=..2] remove gm4_block_compressor_processing
