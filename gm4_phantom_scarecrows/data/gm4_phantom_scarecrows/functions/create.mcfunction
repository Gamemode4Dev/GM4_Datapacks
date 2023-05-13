# @s = armor stand with cursed chestplate
# at world spawn
# ran from creation_checks

#check for skulls
execute if entity @s[nbt={ArmorItems:[{},{},{},{id:"minecraft:wither_skeleton_skull"}]}] run tag @s add gm4_phantom_scarecrow
execute if entity @s[tag=!gm4_phantom_scarecrow,nbt={ArmorItems:[{},{},{},{id:"minecraft:skeleton_skull"}]}] run tag @s add gm4_phantom_scarecrow
execute if entity @s[tag=!gm4_phantom_scarecrow,nbt={ArmorItems:[{},{},{},{id:"minecraft:zombie_head"}]}] run tag @s add gm4_phantom_scarecrow
#initialise scoreboard and add gm4_no_edit tag
scoreboard players add @s[tag=gm4_phantom_scarecrow] gm4_ps_time 0
tag @s[tag=gm4_phantom_scarecrow] add gm4_no_edit
tag @s[tag=gm4_phantom_scarecrow] add smithed.entity
scoreboard players set @s[tag=gm4_phantom_scarecrow] gm4_entity_version 1
#lock slots
data merge entity @s[tag=gm4_phantom_scarecrow] {Invisible:0b,Invulnerable:0b,DisabledSlots:2039583,ShowArms:1b,Pose:{LeftArm:[346f,0f,274f],RightArm:[350f,0f,85f]}}
