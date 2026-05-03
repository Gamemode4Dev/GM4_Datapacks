# places the smeltery down based on rotation
# @s = player who placed the smeltery
# located at the center of the placed block, rotated same cardinal direction as @s
# with {facing, rotation}
# run from gm4_smelteries:machine/create

# place furnace
$setblock ~ ~ ~ furnace[facing=$(facing)]
data merge block ~ ~ ~ {CustomName:{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.smeltery","fallback":"Smeltery"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.smeltery","fallback":"Smeltery","font":"gm4:half_invert"},{"translate":"container.gm4.smeltery","fallback":"Smeltery","font":"gm4:offscreen"},{"translate":"gui.gm4.smeltery","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.smeltery","fallback":"Smeltery","font":"gm4:half_invert"},{"translate":"container.gm4.smeltery","fallback":"Smeltery","font":"gm4:default","color":"#404040"}]]}}

# summon cauldron display
$summon item_display ~ ~ ~ {\
  CustomName:"gm4_smeltery_cauldron",\
  Tags:["gm4_no_edit","gm4_smeltery_cauldron","gm4_machine_display","smithed.entity","smithed.strict","gm4_new_machine"],\
  item_display:head,\
  brightness:{sky:15,block:15},\
  Rotation:$(rotation),\
  transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.1875f,-1.0f],scale:[0.625,0.625,0.625]}\
}

# summon display and marker entity
$summon item_display ~ ~ ~ {\
  CustomName:"gm4_smeltery_display",\
  Tags:["gm4_no_edit","gm4_smeltery_display","gm4_machine_display","smithed.entity","smithed.strict","gm4_new_machine"],\
  item:{id:"minecraft:iron_block",count:1,components:{"minecraft:custom_model_data":{"strings":["gm4_smelteries:block/smeltery_unlit"]}}},\
  item_display:head,\
  brightness:{sky:15,block:15},\
  Rotation:$(rotation),\
  transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.601f,0f],scale:[0.438,0.438,0.438]}\
}
$summon marker ~ ~ ~ {Tags:["gm4_smeltery","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_smeltery",Rotation:$(rotation)}
