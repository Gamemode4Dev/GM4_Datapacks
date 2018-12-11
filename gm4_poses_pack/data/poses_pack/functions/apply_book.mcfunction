# @s = written book ..1 from armor_stand
execute if entity @s[nbt={Item:{tag:{pages:["legs standing"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{LeftLeg:[0f,0f,0f],RightLeg:[0f,0f,0f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["legs sitting"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{LeftLeg:[278f,347f,0f],RightLeg:[278f,11f,0f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["legs walking"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{LeftLeg:[39f,0f,0f],RightLeg:[317f,0f,0f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["legs flying"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{LeftLeg:[108f,0f,0f],RightLeg:[90f,0f,0f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["arms reaching"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{LeftArm:[254f,0f,0f],RightArm:[254f,0f,0f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["arms default"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["arms swinging"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{LeftArm:[304f,0f,0f],RightArm:[40f,0f,0f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["arms resting"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{LeftArm:[263f,340f,188f],RightArm:[263f,25f,188f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["arms raised"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{LeftArm:[179f,0f,24f],RightArm:[179f,0f,344f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["head forward"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{Head:[0f,0f,0f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["head up"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{Head:[325f,0f,0f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["head down"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{Head:[32f,0f,0f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["head left"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{Head:[0f,327f,0f]},Tags:[gm4_pose_changed]}
execute if entity @s[nbt={Item:{tag:{pages:["head right"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{Head:[0f,32f,0f]},Tags:[gm4_pose_changed]}

execute as @e[type=armor_stand,tag=!gm4_no_edit,tag=gm4_pose_changed] run function poses_pack:pose_changed
