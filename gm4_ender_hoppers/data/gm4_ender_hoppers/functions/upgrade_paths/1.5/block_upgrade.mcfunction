# run from upgrade_paths/1.5
# @s = ender hopper display armor stand to be replaced

summon item_display ~ ~0.5 ~ {item:{id:"minecraft:player_head",count:1,components:{"minecraft:custom_model_data":'block/ender_hopper',"minecraft:profile":"$ender_hopper_display"}},item_display:"head",CustomName:'"gm4_ender_hopper_display"',Tags:["gm4_ender_hopper_display","smithed.entity","smithed.strict","gm4_new_machine"],transformation:{scale:[0.83,0.83,0.83],left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],translation:[0.0,0.641,0.0]},Rotation:[0.0f,0.0f]}

# side-facing hopper, set the right CMD
execute if entity @s[nbt={HandItems:[{components:{"minecraft:custom_model_data":3420008}},{}]}] run data modify entity @e[type=item_display,limit=1,distance=..0.6,tag=gm4_new_machine] item.components."minecraft:custom_model_data" set value "block/ender_hopper_side"

data modify entity @e[type=item_display,limit=1,distance=..0.6,tag=gm4_new_machine] Rotation set from entity @s Rotation
scoreboard players set @e[type=item_display,limit=1,distance=..0.6,tag=gm4_new_machine] gm4_entity_version 2
scoreboard players set @e[type=marker,limit=1,distance=..0.6,tag=gm4_ender_hopper] gm4_entity_version 2
tag @e[type=item_display,distance=..0.6,tag=gm4_new_machine] remove gm4_new_machine
kill @s
