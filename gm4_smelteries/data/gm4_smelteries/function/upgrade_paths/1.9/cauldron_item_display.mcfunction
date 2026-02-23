# @s = gm4_smeltery_cauldron armor stand
# at center of smeltery
# run from upgrade_paths/1.9

# create item display
summon item_display ~ ~ ~ {\
  CustomName:"gm4_smeltery_cauldron",\
  Tags:["gm4_no_edit","gm4_smeltery_cauldron","gm4_machine_display","smithed.entity","smithed.strict","gm4_new_machine"],\
  item_display:head,\
  brightness:{sky:15,block:15},\
  transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.1875f,-1.0f],scale:[0.625,0.625,0.625]}\
}
# copy data from armor stand
execute rotated as @s run rotate @e[type=item_display,tag=gm4_smeltery_cauldron,limit=1,distance=..0.01] ~ ~
item replace entity @e[type=item_display,tag=gm4_smeltery_cauldron,limit=1,distance=..0.01] contents from entity @s armor.head
# copy entity version (we dont technically need to increment it)
scoreboard players operation @e[type=item_display,tag=gm4_smeltery_cauldron,limit=1,distance=..0.01] gm4_entity_version = @s gm4_entity_version

kill @s
