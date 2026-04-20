# @s = gm4_disassembler_stand armor stand
# at center of disassembler
# run from upgrade_paths/2.6

summon item_display ~ ~ ~ {\
  CustomName:"gm4_disassembler_display",\
  Tags:["gm4_no_edit","gm4_disassembler_display","gm4_machine_display","smithed.entity","smithed.strict"],\
  item:{id:"minecraft:tnt",count:1,components:{"minecraft:custom_model_data":{"strings":["gm4_disassemblers:block/disassembler_down"]}}},\
  item_display:head,\
  brightness:{sky:15,block:15},\
  Rotation:[0.0f,0.0f],\
  transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.501f,0f],scale:[0.438,0.438,0.438]}\
}
# transfer data, increment entity version number
data modify entity @e[type=item_display,tag=gm4_disassembler_display,limit=1,distance=..0.01] item.components."minecraft:custom_model_data" set from entity @s equipment.head.components."minecraft:custom_model_data"
data modify entity @e[type=item_display,tag=gm4_disassembler_display,limit=1,distance=..0.01] Rotation set from entity @s Rotation
scoreboard players set @e[type=item_display,tag=gm4_disassembler_display,limit=1,distance=..0.01] gm4_entity_version 2
scoreboard players set @e[type=marker,tag=gm4_disassembler,limit=1,distance=..0.01] gm4_entity_version 2

kill @s
