# @s = written book ..1 from armor_stand
#copy player rotation to armor_stand part
execute if entity @s[tag=!gm4_pose_changed,nbt={Item:{tag:{pages:["rotate"]}}}] as @e[distance=..1,type=armor_stand,sort=nearest,tag=!gm4_no_edit] run data modify entity @s Rotation set from entity @p[distance=..1] Rotation
execute if entity @s[tag=!gm4_pose_changed,nbt={Item:{tag:{pages:["head"]}}}] run function gm4_poses_pack:pose/head
execute if entity @s[tag=!gm4_pose_changed,nbt={Item:{tag:{pages:["body"]}}}] run function gm4_poses_pack:pose/body
execute if entity @s[tag=!gm4_pose_changed,nbt={Item:{tag:{pages:["arms"]}}}] run function gm4_poses_pack:pose/arms
execute if entity @s[tag=!gm4_pose_changed,nbt={Item:{tag:{pages:["legs"]}}}] run function gm4_poses_pack:pose/legs
tag @s add gm4_pose_changed

#copy pose to armor_stand item
execute if entity @s[nbt={Item:{tag:{pages:["copy"]}}}] as @e[type=minecraft:item,distance=..1,limit=1,nbt={Item:{id:"minecraft:armor_stand"}},tag=!gm4_pose_copied] run function gm4_poses_pack:copy

execute as @e[type=armor_stand,tag=!gm4_no_edit,tag=gm4_pose_changed] run function gm4_poses_pack:pose_changed
