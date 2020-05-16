# @s = written book ..1 from armor_stand

#if page 2 does not exist, set head from player rotation
execute unless data entity @s Item.tag.pages[1] if entity @p[distance=..1] as @e[distance=..1,type=armor_stand,sort=nearest,tag=!gm4_no_edit] run function gm4_poses_pack:pose/player/body

#predefined poses
execute if entity @s[nbt={Item:{tag:{pages:["reset"]}}}] run data merge entity @e[type=armor_stand,distance=..1,limit=1,sort=nearest,tag=!gm4_no_edit] {Pose:{Body:[-.1f,0f,0f]}}
