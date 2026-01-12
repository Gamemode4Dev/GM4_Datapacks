# places the liquid_tank down based on rotation
# @s = player who placed the liquid_tank
# located at the center of the placed block
# run from gm4_liquid_tanks:machine/create

# place hopper
setblock ~ ~ ~ hopper[facing=down]{CustomName:{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.liquid_tank.empty","fallback":"Empty Tank"},[{"translate":"gui.gm4.liquid_tank","fallback":"","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.liquid_tank.empty","fallback":"Empty Tank","font":"gm4:default","color":"#404040"}]]}}

# summon display entity and marker entity
summon item_display ~ ~0.4 ~ {Tags:["gm4_liquid_tank_display","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_liquid_tank_display",item:{id:"glass",count:1,components:{"minecraft:custom_model_data":"block/liquid_tank"}},Rotation:[0.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.001f,0f],scale:[0.438,0.438,0.438]},item_display:'head'}
summon marker ~ ~ ~ {Tags:["gm4_liquid_tank","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_liquid_tank",Rotation:[0.0f,0.0f]}
