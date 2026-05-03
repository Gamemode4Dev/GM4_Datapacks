# @s = gm4_smeltery_stand armor stand
# at center of smeltery
# run from upgrade_paths/1.9

# create item display
summon item_display ~ ~ ~ {\
  CustomName:"gm4_smeltery_display",\
  Tags:["gm4_no_edit","gm4_smeltery_display","gm4_machine_display","smithed.entity","smithed.strict","gm4_new_machine"],\
  item:{id:"minecraft:iron_block",count:1,components:{"minecraft:custom_model_data":{"strings":["gm4_smelteries:block/smeltery_unlit"]}}},\
  item_display:head,\
  brightness:{sky:15,block:15},\
  Rotation:[0.0f,0.0f],\
  transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.601f,0f],scale:[0.438,0.438,0.438]}\
}
# copy data from armor stand
execute rotated as @s run rotate @e[type=item_display,tag=gm4_smeltery_display,limit=1,distance=..0.01] ~ ~
item replace entity @e[type=item_display,tag=gm4_smeltery_display,limit=1,distance=..0.01] contents from entity @s armor.head
# increment entity version (this function handles the marker as well)
scoreboard players set @e[type=item_display,tag=gm4_smeltery_display,limit=1,distance=..0.01] gm4_entity_version 2
scoreboard players set @e[type=marker,tag=gm4_smeltery,limit=1,distance=..0.01] gm4_entity_version 2

kill @s
