# places the custom_crafter down based on rotation
# @s = player who placed the custom_crafter
# located at the center of the placed block
# run from gm4_custom_crafters:machine/create

# place dropper
setblock ~ ~ ~ dropper[facing=down]{CustomName:{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.custom_crafter","fallback":"Custom Crafter"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.custom_crafter","fallback":"Custom Crafter","font":"gm4:half_invert"},{"translate":"container.gm4.custom_crafter","fallback":"Custom Crafter","font":"gm4:offscreen"},{"translate":"gui.gm4.custom_crafter","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.custom_crafter","fallback":"Custom Crafter","font":"gm4:half_invert"},{"translate":"container.gm4.custom_crafter","fallback":"Custom Crafter","font":"gm4:default","color":"#404040"}]]}}

# summon display and marker entity
summon item_display ~ ~0.5 ~ {Tags:["gm4_no_edit","gm4_custom_crafter_display","gm4_machine_display","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_custom_crafter_display",item:{id:"crafting_table",count:1,components:{"minecraft:custom_model_data":"block/custom_crafter_down"}},item_display:head,brightness:{sky:15,block:15},Rotation:[180.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.001f,0f],scale:[0.438,0.438,0.438]}}
summon marker ~ ~ ~ {Tags:["gm4_custom_crafter","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_custom_crafter",Rotation:[180.0f,0.0f]}
