# summons the entities for this machine
# @s = player who placed the block
# located at the center of the block to be placed
# run from gm4_disassemblers:relocate/place_down_check

scoreboard players set $placed_block gm4_rl_data 1

summon item_display ~ ~ ~ {item:{id:"minecraft:player_head",count:1,components:{"minecraft:custom_model_data":"block/ender_hopper","minecraft:profile":"$ender_hopper_display"}},item_display:head,CustomName:"gm4_ender_hopper_display",Tags:["gm4_ender_hopper_display","smithed.entity","smithed.strict","gm4_new_machine"],transformation:{scale:[0.83,0.83,0.83],left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],translation:[0.0,0.641,0.0]}}
summon marker ~ ~ ~ {Tags:["gm4_ender_hopper","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_ender_hopper",Rotation:[0.0f,0.0f]}

execute as @e[tag=gm4_new_machine,distance=..2] run data modify entity @s Rotation set from storage gm4_relocators:temp gm4_relocation.entity_data.Rotation
execute as @e[tag=gm4_new_machine,distance=..2] at @s rotated as @e[type=marker,tag=gm4_new_machine,distance=..2,limit=1] run tp ~ ~ ~
execute as @e[type=item_display,tag=gm4_new_machine,distance=..2] run data modify entity @s item set from storage gm4_relocators:temp gm4_relocation.entity_data.item
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 2
tag @e[distance=..2] remove gm4_new_machine
