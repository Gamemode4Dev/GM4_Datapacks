# places the teleportation_jammer down
# @s = player who placed the teleportation_jammer
# located at the center of the placed block
# run from gm4_teleportation_anchors:machine/verify_place_down

# place dropper
setblock ~ ~ ~ dropper[facing=up]{CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.teleportation_jammer","fallback":"Teleportation Jammer"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.teleportation_jammer","fallback":"Teleportation Jammer","font":"gm4:half_invert"},{"translate":"container.gm4.teleportation_jammer","fallback":"Teleportation Jammer","font":"gm4:offscreen"},{"translate":"gui.gm4.teleportation_jammer","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.teleportation_jammer","fallback":"Teleportation Jammer","font":"gm4:half_invert"},{"translate":"container.gm4.teleportation_jammer","fallback":"Teleportation Jammer","font":"gm4:default","color":"#404040"}]]}'}

# summon display armor stand and marker entity
summon armor_stand ~ ~-0.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_teleportation_jammer_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_teleportation_jammer_stand"',ArmorItems:[{},{},{},{id:"purpur_pillar",Count:1b,tag:{CustomModelData:3420001}}],Rotation:[0.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["gm4_teleportation_jammer","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_teleportation_jammer"',Rotation:[0.0f,0.0f]}

# set id
execute store result score @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.01] gm4_ta_jam_id run data get entity @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.01] UUID[3]

# mark block as placed
playsound minecraft:block.chorus_flower.death block @a[distance=..8] ~ ~ ~ 100 1.3
playsound minecraft:block.beacon.power_select block @a[distance=..8] ~ ~ ~ 0.3 0.3
scoreboard players set $placed_block gm4_machine_data 1
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..2] remove gm4_new_machine
