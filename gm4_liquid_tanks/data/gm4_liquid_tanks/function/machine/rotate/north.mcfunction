# places the liquid_tank down based on rotation
# @s = player who placed the liquid_tank
# located at the center of the placed block
# run from gm4_liquid_tanks:machine/create

# place hopper
setblock ~ ~ ~ hopper[facing=north]{CustomName:{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.liquid_tank.empty","fallback":"Empty Tank"},[{"translate":"gui.gm4.liquid_tank","fallback":"","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.liquid_tank.empty","fallback":"Empty Tank","font":"gm4:default","color":"#404040"}]]}}

# summon display armor stand and marker entity
summon armor_stand ~ ~-0.5 ~ {Small:1b,NoGravity:1b,Marker:1b,Invulnerable:1b,Invisible:1b,Silent:1b,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1b,CustomName:"gm4_liquid_tank_stand",equipment:{head:{id:"glass",count:1,components:{"minecraft:custom_model_data":"block/liquid_tank_side"}}},Rotation:[180.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["gm4_liquid_tank","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:"gm4_liquid_tank",Rotation:[180.0f,0.0f]}
