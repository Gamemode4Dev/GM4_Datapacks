# sets the specific relocator data
# @s = "smithed.block" entity inside the block
# located at the center of the block to be picked up
# run from gm4_tinkering_compressors:relocate/pick_up_check

data modify storage gm4_relocators:temp merge_data set value {custom_block:"gm4_tinkering_compressor",lore:'{"translate":"%1$s%3427655$s","with":["Tinkering Compressor",{"translate":"block.gm4.tinkering_compressor"}],"color":"gray","italic":true}'}

execute positioned ~ ~-0.98 ~ run kill @e[type=armor_stand,tag=gm4_tinkering_compressor_stand,limit=1,distance=..0.1]
execute positioned ~ ~-0.4 ~ run kill @e[type=armor_stand,tag=gm4_tinkering_compressor_display,limit=1,distance=..0.1]
kill @s
scoreboard players set $found_marker gm4_rl_data 1
