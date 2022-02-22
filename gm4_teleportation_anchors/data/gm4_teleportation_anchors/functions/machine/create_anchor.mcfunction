# places the teleportation_anchor down
# @s = player who placed the teleportation_anchor
# located at the center of the placed block
# run from gm4_teleportation_anchors:machine/verify_place_down

# place dropper
setblock ~ ~ ~ lodestone

# summon display armor stand and marker entity
summon armor_stand ~ ~-0.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_teleportation_anchor_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_teleportation_anchor_stand"',ArmorItems:[{},{},{},{id:"end_portal_frame",Count:1b,tag:{CustomModelData:3420001}}],Rotation:[0.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["gm4_teleportation_anchor","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_teleportation_anchor"',Rotation:[0.0f,0.0f]}

# mark block as placed
playsound minecraft:block.end_portal.spawn block @a[distance=..8] ~ ~ ~ 0.3 1.8
scoreboard players set $placed_block gm4_machine_data 1
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..2] remove gm4_new_machine
