# places the block_compressor down
# @s = player who placed the block_compressor
# located at the center of the placed block
# run from gm4_block_compressors:machine/verify_place_down

# place dropper
setblock ~ ~ ~ dropper[facing=down]{CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.block_compressor","fallback":"Compression Amount"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.block_compressor","fallback":"Compression Amount","font":"gm4:half_invert"},{"translate":"container.gm4.block_compressor","fallback":"Compression Amount","font":"gm4:offscreen"},{"translate":"gui.gm4.block_compressor","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.block_compressor","fallback":"Compression Amount","font":"gm4:half_invert"},{"translate":"container.gm4.block_compressor","fallback":"Compression Amount","font":"gm4:default","color":"#404040"}]]}'}

# summon display armor stand and marker entity
summon item_display ~ ~ ~ {Tags:["gm4_block_compressor_plate","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_block_compressor_plate"',item:{id:"minecraft:purpur_block",count:1,components:{"minecraft:custom_model_data":"block/block_compressor_plate"}},transformation:{right_rotation:[0f,0f,0f,1f],left_rotation:[1f,0f,0f,0f],translation:[0.0,0.225,0.0],scale:[0.625,0.625,0.625]},brightness:{block:15,sky:15},item_display:"head"}
summon item_display ~ ~ ~ {Tags:["gm4_block_compressor_display","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_block_compressor_display"',item:{id:"minecraft:stone",count:1,components:{"minecraft:custom_model_data":"block/block_compressor"}},transformation:{right_rotation:[0f,0f,0f,1f],left_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5,0.5,0.5]},brightness:{block:15,sky:15},item_display:"head"}
summon marker ~ ~ ~ {Tags:["gm4_block_compressor","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_block_compressor"',Rotation:[0.0f,0.0f]}

# mark block as placed
playsound minecraft:block.piston.contract block @a[distance=..5]
scoreboard players set $placed_block gm4_machine_data 1
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 2
tag @e[distance=..2] remove gm4_new_machine
