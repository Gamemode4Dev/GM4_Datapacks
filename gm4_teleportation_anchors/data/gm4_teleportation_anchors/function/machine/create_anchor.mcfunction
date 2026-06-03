# places the teleportation_anchor down
# @s = player who placed the teleportation_anchor
# located at the center of the placed block
# run from gm4_teleportation_anchors:machine/verify_place_down

# place lodestone
setblock ~ ~ ~ lodestone

# summon display and marker entity
summon minecraft:item_display ~ ~ ~ {\
  CustomName:"gm4_teleportation_anchor_display",\
  Tags:["gm4_no_edit","gm4_teleportation_anchor_display","gm4_machine_display","smithed.entity","smithed.strict","gm4_new_machine"],\
  item:{id:"end_portal_frame",count:1,components:{"minecraft:custom_model_data":{"strings":["gm4_teleportation_anchors:block/teleportation_anchor"]}}},\
  item_display:head,\
  brightness:{sky:15,block:15},\
  Rotation:[0.0f,0.0f],\
  transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.501f,0f],scale:[0.438,0.438,0.438]}\
}
summon marker ~ ~ ~ {Tags:["gm4_teleportation_anchor","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_teleportation_anchor",Rotation:[0.0f,0.0f]}

# mark block as placed
playsound minecraft:block.end_portal.spawn block @a[distance=..8] ~ ~ ~ 0.3 1.8
scoreboard players set $placed_block gm4_machine_data 1
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 2
tag @e[distance=..2] remove gm4_new_machine
