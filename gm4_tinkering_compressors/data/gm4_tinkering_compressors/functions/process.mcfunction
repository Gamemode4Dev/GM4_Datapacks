# @s = tinkering compressor
# at @s
# run from tinkering_compressors:main

tag @s add gm4_compressor_processing
execute positioned ~ ~0.9 ~ if entity @e[type=item,tag=!gm4_tc_locked,distance=..1,nbt=!{Item:{tag:{gm4_compressed:{}}}}] positioned ~ ~-0.9 ~ run function gm4_tinkering_compressors:item
particle dust 0.624 0.769 0.671 1 ~ ~0.9 ~ 0 0.15 0 0.01 15

# simulate pressure plate
execute positioned ~ ~-0.995 ~ as @e[type=armor_stand,tag=gm4_tinkering_compressor_stand,tag=gm4_compressor_depressed,distance=..0.01,limit=1] positioned ~-0.5 ~1.495 ~-0.5 unless entity @e[dx=0] at @s run function gm4_tinkering_compressors:pressure_plate_up
execute positioned ~-0.5 ~0.5 ~-0.5 if entity @e[dx=0] positioned ~0.5 ~-1.465 ~0.5 as @e[type=armor_stand,tag=gm4_tinkering_compressor_stand,tag=!gm4_compressor_depressed,distance=..0.01,limit=1] at @s run function gm4_tinkering_compressors:pressure_plate_down
execute if entity @s[tag=gm4_compressor_sound] run playsound block.stone_pressure_plate.click_on block @a[distance=..6] ~ ~0.505 ~ 0.7 0.6

# clean up
tag @s remove gm4_compressor_sound
tag @s remove gm4_compressor_processing
