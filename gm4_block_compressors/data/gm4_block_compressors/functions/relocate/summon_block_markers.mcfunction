# summons the entities for this machine
# @s = player who placed the block
# located at the center of the block to be placed
# run from gm4_block_compressors:relocate/place_down_check

scoreboard players set $placed_block gm4_rl_data 1

summon item_display ~ ~ ~ {Tags:["gm4_block_compressor_plate","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_block_compressor_plate"',item:{id:"minecraft:purpur_block",count:1,components:{"minecraft:custom_model_data":"block/block_compressor_plate"}},transformation:{right_rotation:[0f,0f,0f,1f],left_rotation:[1f,0f,0f,0f],translation:[0.0,0.225,0.0],scale:[0.625,0.625,0.625]},brightness:{block:15,sky:15},item_display:"head"}
summon item_display ~ ~ ~ {Tags:["gm4_block_compressor_display","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_block_compressor_display"',item:{id:"minecraft:stone",count:1,components:{"minecraft:custom_model_data":"block/block_compressor"}},transformation:{right_rotation:[0f,0f,0f,1f],left_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5,0.5,0.5]},brightness:{block:15,sky:15},item_display:"head"}
summon marker ~ ~ ~ {Tags:["gm4_block_compressor","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_block_compressor"',Rotation:[0.0f,0.0f]}

scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 2
tag @e[distance=..2] remove gm4_new_machine
