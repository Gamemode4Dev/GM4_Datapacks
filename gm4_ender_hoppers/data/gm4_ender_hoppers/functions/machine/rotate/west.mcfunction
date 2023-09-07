# places the ender_hopper down based on rotation
# @s = player who placed the ender_hopper
# located at the center of the placed block
# run from gm4_ender_hoppers:machine/create

# place hopper
setblock ~ ~ ~ hopper[facing=west]{CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.ender_hopper","fallback":"Ender Hopper"},[{"translate":"gui.gm4.ender_hopper","fallback":"","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.ender_hopper","fallback":"Ender Hopper","font":"gm4:default","color":"#404040"}]]}'}

# summon display armor stand and marker entity
summon armor_stand ~ ~-0.5 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_ender_hopper_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_ender_hopper_stand"',ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:3420002,SkullOwner:"$ender_hopper_display_2"}}],HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:3420008}},{}],Pose:{RightArm:[0f, 0f, 0f]},Rotation:[90.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["gm4_ender_hopper","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_ender_hopper"',Rotation:[90.0f,0.0f]}
