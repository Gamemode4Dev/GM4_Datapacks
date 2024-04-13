# places the ender_hopper down based on rotation
# @s = player who placed the ender_hopper
# located at the center of the placed block
# run from gm4_ender_hoppers:machine/create

# place hopper
setblock ~ ~ ~ hopper[facing=west]{CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.ender_hopper","fallback":"Ender Hopper"},[{"translate":"gui.gm4.ender_hopper","fallback":"","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.ender_hopper","fallback":"Ender Hopper","font":"gm4:default","color":"#404040"}]]}'}

# summon display armor stand and marker entity
summon item_display ~ ~ ~ {item:{id:"minecraft:player_head",count:1,components:{"minecraft:custom_model_data":'block/ender_hopper',"minecraft:profile":"$ender_hopper_display"}},item_display:head,CustomName:'"gm4_ender_hopper_display"',Tags:["gm4_ender_hopper_display","smithed.entity","smithed.strict","gm4_new_machine"],transformation:{scale:[0.83,0.83,0.83],left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],translation:[0.0,0.641,0.0]},Rotation:[90.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["gm4_ender_hopper","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_ender_hopper"',Rotation:[90.0f,0.0f]}
