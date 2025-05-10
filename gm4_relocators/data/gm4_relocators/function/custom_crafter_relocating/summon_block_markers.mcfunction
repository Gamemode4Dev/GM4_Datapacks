# summons the entities for this machine
# @s = player who placed the block
# located at the center of the block to be placed
# run from gm4_relocators:custom_crafter_relocating/place_down_check

scoreboard players set $placed_block gm4_rl_data 1

summon item_display ~ ~0.5 ~ {Tags:["gm4_no_edit","gm4_custom_crafter_display","gm4_machine_display","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_custom_crafter_display",item:{id:"crafting_table",count:1,components:{"minecraft:custom_model_data":"gm4_custom_crafters:block/custom_crafter"}},item_display:head,brightness:{sky:15,block:15},Rotation:[180.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.001f,0f],scale:[0.438,0.438,0.438]}}
summon marker ~ ~ ~ {Tags:["gm4_custom_crafter","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_custom_crafter",Rotation:[0.0f,0.0f]}

execute as @e[tag=gm4_new_machine,distance=..2] run data modify entity @s Rotation set from storage gm4_relocators:temp gm4_relocation.entity_data.Rotation
execute as @e[tag=gm4_new_machine,distance=..2] at @s rotated as @e[type=marker,tag=gm4_new_machine,distance=..2,limit=1] run tp ~ ~ ~
execute as @e[type=item_display,tag=gm4_new_machine,distance=..2] run data modify entity @s item set from storage gm4_relocators:temp gm4_relocation.entity_data.item
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 2
tag @e[distance=..2] remove gm4_new_machine
