# summons the entities for this machine
# @s = player who placed the block
# located at the center of the block to be placed
# run from gm4_teleportation_anchors:relocate/place_down_check

# summon entities
summon armor_stand ~ ~-0.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_teleportation_jammer_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_teleportation_jammer_stand"',ArmorItems:[{},{},{},{id:"purpur_pillar",Count:1b,tag:{CustomModelData:3420001}}],Rotation:[0.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["gm4_teleportation_jammer","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_teleportation_jammer"',Rotation:[0.0f,0.0f]}

# set id
execute store result score @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.01] gm4_ta_jam_id run data get entity @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.01] UUID[3]

# set entity version
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..2] remove gm4_new_machine
