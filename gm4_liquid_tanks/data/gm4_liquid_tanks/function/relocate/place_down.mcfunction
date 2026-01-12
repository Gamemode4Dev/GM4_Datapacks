# @s = command block placed by "gm4_relocators:backwards_compatibility/place_down/replace_head"
# located at the command block (where the player head was)

execute if block ~ ~ ~ command_block[facing=east] run setblock ~ ~ ~ hopper[facing=east]
execute if block ~ ~ ~ command_block[facing=west] run setblock ~ ~ ~ hopper[facing=west]
execute if block ~ ~ ~ command_block[facing=south] run setblock ~ ~ ~ hopper[facing=south]
execute if block ~ ~ ~ command_block[facing=north] run setblock ~ ~ ~ hopper[facing=north]
execute if block ~ ~ ~ command_block[facing=down] run setblock ~ ~ ~ hopper[facing=down]

data merge block ~ ~ ~ {CustomName:{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.liquid_tank.empty","fallback":"Empty Tank"},[{"translate":"gui.gm4.liquid_tank","fallback":"","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.liquid_tank.empty","fallback":"Empty Tank","font":"gm4:default","color":"#404040"}]]}}
summon item_display ~ ~0.4 ~ {Tags:["gm4_liquid_tank_display","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_liquid_tank_display",item:{id:"glass",count:1,components:{"minecraft:custom_model_data":"block/liquid_tank"}},Rotation:[0.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.001f,0f],scale:[0.438,0.438,0.438]},item_display:'head'}
summon marker ~ ~ ~ {Tags:["gm4_liquid_tank","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_liquid_tank",Rotation:[0.0f,0.0f]}
execute as @e[tag=gm4_liquid_tank,limit=1,distance=..0.3] run function gm4_liquid_tanks:init_tank_scores
playsound block.end_portal_frame.fill block @a[distance=..30] ~ ~ ~ 1 0.5
