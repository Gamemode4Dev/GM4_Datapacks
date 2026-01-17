# summons the entities for this machine
# @s = player who placed the block
# located at the center of the block to be placed
# run from gm4_liquid_tanks:relocate/place_down_check

scoreboard players set $placed_block gm4_rl_data 1

summon item_display ~ ~0.4 ~ {Tags:["gm4_liquid_tank_display","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_liquid_tank_display",item:{id:"glass",count:1,components:{"minecraft:custom_model_data":"block/liquid_tank"}},Rotation:[0.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.001f,0f],scale:[0.438,0.438,0.438]},item_display:'head'}
summon marker ~ ~ ~ {Tags:["gm4_liquid_tank","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_liquid_tank",Rotation:[0.0f,0.0f]}

execute as @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] run function gm4_liquid_tanks:relocate/restore_liquid

execute as @e[tag=gm4_new_machine,distance=..2] run data modify entity @s Rotation set from storage gm4_relocators:temp gm4_relocation.entity_data.Rotation
execute as @e[tag=gm4_new_machine,distance=..2] at @s rotated as @e[type=marker,tag=gm4_new_machine,distance=..2,limit=1] run tp ~ ~ ~
execute as @e[type=item_display,tag=gm4_new_machine,distance=..2] run data modify entity @s {} merge from storage gm4_relocators:temp gm4_relocation.entity_data.display
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 2
tag @e[distance=..2] remove gm4_new_machine
