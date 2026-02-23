# places the disassembler down based on rotation
# @s = player who placed the disassembler
# located at the center of the placed block
# run from gm4_disassemblers:machine/create

# place dropper
$setblock ~ ~ ~ dropper[facing=$(facing)]
data merge block ~ ~ ~ {CustomName:{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.disassembler","fallback":"Disassembler"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.disassembler","fallback":"Disassembler","font":"gm4:half_invert"},{"translate":"container.gm4.disassembler","fallback":"Disassembler","font":"gm4:offscreen"},{"translate":"gui.gm4.disassembler","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.disassembler","fallback":"Disassembler","font":"gm4:half_invert"},{"translate":"container.gm4.disassembler","fallback":"Disassembler","font":"gm4:default","color":"#404040"}]]}}

# summon display and marker entity
$summon item_display ~ ~ ~ {\
  CustomName:"gm4_disassembler_display",\
  Tags:["gm4_no_edit","gm4_disassembler_display","gm4_machine_display","smithed.entity","smithed.strict","gm4_new_machine"],\
  item:{id:"minecraft:tnt",count:1,components:{"minecraft:custom_model_data":{"strings":["$(model)"]}}},\
  item_display:head,\
  brightness:{sky:15,block:15},\
  Rotation:$(Rotation),\
  transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.501f,0f],scale:[0.438,0.438,0.438]}\
}

$summon marker ~ ~ ~ {Tags:["gm4_disassembler","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_disassembler",Rotation:$(Rotation)}
