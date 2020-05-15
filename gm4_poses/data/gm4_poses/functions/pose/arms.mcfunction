# @s = written book ..1 from armor_stand

#predefined poses
execute if entity @s[nbt={Item:{tag:{pages:["hanging"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["reaching"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{LeftArm:[254f,0f,0f],RightArm:[254f,0f,0f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["swinging"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{LeftArm:[304f,0f,0f],RightArm:[40f,0f,0f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["resting"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{LeftArm:[263f,340f,188f],RightArm:[263f,25f,188f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["raised"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{LeftArm:[179f,0f,24f],RightArm:[179f,0f,344f]},Tags:[gm4_pose_changed]}

#if page 2 does not exist, set both arms from player rotation
execute unless data entity @s Item.tag.pages[1] if entity @p[distance=..1] as @e[distance=..1,type=armor_stand,sort=nearest,tag=!gm4_no_edit] run function gm4_poses:pose/player/arm_left
execute unless data entity @s Item.tag.pages[1] if entity @p[distance=..1] as @e[distance=..1,type=armor_stand,sort=nearest,tag=!gm4_no_edit] run function gm4_poses:pose/player/arm_right

#if book contains a page with "left" or "right", set this arm from player rotation
execute if entity @s[nbt={Item:{tag:{pages:["left"]}}}] if entity @p[distance=..1] as @e[distance=..1,type=armor_stand,sort=nearest,tag=!gm4_no_edit] run function gm4_poses:pose/player/arm_left
execute if entity @s[nbt={Item:{tag:{pages:["right"]}}}] if entity @p[distance=..1] as @e[distance=..1,type=armor_stand,sort=nearest,tag=!gm4_no_edit] run function gm4_poses:pose/player/arm_right

#if book contains a page with "mirror", mirror this pose to the other arm
execute if entity @s[nbt={Item:{tag:{pages:["mirror","left"]}}}] as @e[distance=..1,type=armor_stand,sort=nearest,tag=!gm4_no_edit] run function gm4_poses:pose/player/mirror_arm_left
execute if entity @s[nbt={Item:{tag:{pages:["mirror","right"]}}}] as @e[distance=..1,type=armor_stand,sort=nearest,tag=!gm4_no_edit] run function gm4_poses:pose/player/mirror_arm_right

#if book contains a page with "swap" or "flip"
execute if entity @s[nbt={Item:{tag:{pages:["swap"]}}}] as @e[distance=..1,type=armor_stand,sort=nearest,tag=!gm4_no_edit] run function gm4_poses:pose/player/swap_arms
execute if entity @s[nbt={Item:{tag:{pages:["flip"]}}}] as @e[distance=..1,type=armor_stand,sort=nearest,tag=!gm4_no_edit] run function gm4_poses:pose/player/flip_arms
