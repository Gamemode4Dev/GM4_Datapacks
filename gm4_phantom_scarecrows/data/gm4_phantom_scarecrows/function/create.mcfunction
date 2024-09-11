# @s = armor stand with cursed chestplate
# at world spawn
# ran from creation_checks

#initialise scoreboard and add tags
tag @s add gm4_phantom_scarecrow
tag @s add gm4_no_edit
tag @s add smithed.entity
scoreboard players add @s gm4_ps_time 0
scoreboard players set @s gm4_entity_version 1
#lock slots
data merge entity @s {Invisible:0b,Invulnerable:0b,DisabledSlots:2039583,ShowArms:1b,Pose:{LeftArm:[346f,0f,274f],RightArm:[350f,0f,85f]}}
