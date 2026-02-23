# @s = gm4_teleportation_anchor_stand armor stand
# at center of block
# run from upgrade_paths/1.7

summon minecraft:item_display ~ ~0.5 ~ {\
  CustomName:"gm4_teleportation_anchor_display",\
  Tags:["gm4_no_edit","gm4_teleportation_anchor_display","gm4_machine_display","smithed.entity","smithed.strict"],\
  item:{id:"end_portal_frame",count:1,components:{"minecraft:custom_model_data":{"strings":["gm4_teleportation_anchors:block/teleportation_anchor"]}}},\
  item_display:head,\
  brightness:{sky:15,block:15},\
  Rotation:[0.0f,0.0f],\
  transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.001f,0f],scale:[0.438,0.438,0.438]}\
}

# entity version
execute positioned ~ ~0.5 ~ run scoreboard players set @e[type=item_display,tag=gm4_teleportation_anchor_display,distance=..0.01,limit=1] gm4_entity_version 2
scoreboard players set @e[type=marker,tag=gm4_teleportation_anchor,distance=..0.01,limit=1] gm4_entity_version 2

kill @s
