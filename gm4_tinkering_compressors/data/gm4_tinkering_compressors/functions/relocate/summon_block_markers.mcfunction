# summons the entities for this machine
# @s = player who placed the block
# located at the center of the block to be placed
# run from gm4_disassemblers:relocate/place_down_check

summon armor_stand ~ ~-0.965 ~ {NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_tinkering_compressor_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_tinkering_compressor_stand"',ArmorItems:[{},{},{},{id:"minecraft:oxidized_cut_copper",Count:1b,tag:{CustomModelData:3420001}}],Pose:{Head:[180f,0f,0f]},Rotation:[0.0f,0.0f]}
summon armor_stand ~ ~-0.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_tinkering_compressor_display","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_tinkering_compressor_display"',HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:3420002}},{}],Pose:{RightArm:[0.0f,0.0f,0.0f]},Rotation:[0.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["gm4_tinkering_compressor","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_tinkering_compressor"',Rotation:[0.0f,0.0f]}

scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..2] remove gm4_new_machine
