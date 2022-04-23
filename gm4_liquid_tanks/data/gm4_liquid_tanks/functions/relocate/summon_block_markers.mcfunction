# summons the entities for this machine
# @s = player who placed the block
# located at the center of the block to be placed
# run from gm4_liquid_tanks:relocate/place_down_check

summon armor_stand ~ ~-0.5 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"',ArmorItems:[{},{},{},{id:"glass",Count:1,tag:{CustomModelData:3420001}}],Rotation:[0.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["gm4_liquid_tank","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_liquid_tank"',Rotation:[0.0f,0.0f]}

execute as @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] run function gm4_liquid_tanks:relocate/restore_liquid

execute as @e[tag=gm4_new_machine,distance=..2] run data modify entity @s Rotation set from storage gm4_relocators:temp gm4_relocation.entity_data.Rotation
execute as @e[tag=gm4_new_machine,distance=..2] at @s rotated as @e[type=marker,tag=gm4_new_machine,distance=..2,limit=1] run tp ~ ~ ~
execute as @e[type=armor_stand,tag=gm4_new_machine,distance=..2] run data modify entity @s {} merge from storage gm4_relocators:temp gm4_relocation.entity_data.stand
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..2] remove gm4_new_machine
