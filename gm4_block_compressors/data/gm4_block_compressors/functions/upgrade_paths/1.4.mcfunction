execute as @e[type=armor_stand,tag=gm4_block_compressor_stand] at @s positioned ~ ~0.965 ~ align y run summon item_display ~ ~0.5 ~ {Tags:["gm4_block_compressor_plate","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_block_compressor_plate"',item:{id:"minecraft:purpur_block",count:1,components:{"minecraft:custom_model_data":"block/block_compressor_plate"}},transformation:{right_rotation:[0f,0f,0f,1f],left_rotation:[1f,0f,0f,0f],translation:[0.0,0.225,0.0],scale:[0.625,0.625,0.625]},brightness:{block:15,sky:15},item_display:"head"}
execute as @e[type=armor_stand,tag=gm4_block_compressor_display] at @s align y run summon item_display ~ ~0.5 ~ {Tags:["gm4_block_compressor_display","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_block_compressor_display"',item:{id:"minecraft:stone",count:1,components:{"minecraft:custom_model_data":"block/block_compressor"}},transformation:{right_rotation:[0f,0f,0f,1f],left_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5,0.5,0.5]},brightness:{block:15,sky:15},item_display:"head"}

execute as @e[type=armor_stand,tag=gm4_block_compressor_display] at @s run scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 2
execute as @e[type=armor_stand,tag=gm4_block_compressor_display] at @s run tag @e[distance=..2] remove gm4_new_machine

kill @e[type=armor_stand,tag=gm4_block_compressor_display]
kill @e[type=armor_stand,tag=gm4_block_compressor_stand]
