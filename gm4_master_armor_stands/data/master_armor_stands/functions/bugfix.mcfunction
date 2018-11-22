#
# Description:	This is a temporary (?) workaround for bug MC-80975
# Called by:	master_armor_stands:trigger
# Entity @s:	armor_stand
#
# Pose data is not stored for parts of the armour stand that are in the "default" positions. This causes the execute store entity
# and data get entity commands to fail.
#
# This function checks for the presence of each parts' pose data and updates it with tweaked default values if not present
#
execute store success score @s gm4_as_pose run data get entity @s Pose.Head[0]
execute if entity @s[scores={gm4_gm4_as_pose=0}] run data merge entity @s {Pose:{Head:[0.0f,0.001f,0.0f]}}
execute store success score @s gm4_as_pose run data get entity @s Pose.Body[0]
execute if entity @s[scores={gm4_as_pose=0}] run data merge entity @s {Pose:{Body:[0.0f,0.001f,0.0f]}}
execute store success score @s gm4_as_pose run data get entity @s Pose.LeftArm[0]
execute if entity @s[scores={gm4_as_pose=0}] run data merge entity @s {Pose:{LeftArm:[-10.0f,0.001f,-10.0f]}}
execute store success score @s gm4_as_pose run data get entity @s Pose.RightArm[0]
execute if entity @s[scores={gm4_as_pose=0}] run data merge entity @s {Pose:{RightArm:[-15.0f,0.001f,10.0f]}}
execute store success score @s gm4_as_pose run data get entity @s Pose.LeftLeg[0]
execute if entity @s[scores={gm4_as_pose=0}] run data merge entity @s {Pose:{LeftLeg:[-1.0f,0.001f,-1.0f]}}
execute store success score @s gm4_as_pose run data get entity @s Pose.RightLeg[0]
execute if entity @s[scores={gm4_as_pose=0}] run data merge entity @s {Pose:{RightLeg:[1.0f,0.001f,1.0f]}}
