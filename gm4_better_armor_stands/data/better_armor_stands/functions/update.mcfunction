execute if entity @s[nbt={Item:{tag:{pages:["default"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] {NoGravity:0,NoBasePlate:0,ShowArms:0,Small:0,Pose:{Head:[0f,0f,0f],LeftLeg:[0f,0f,0f],RightLeg:[0f,0f,0f],Body:[0f,0f,0f],LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]}}
execute if entity @s[nbt={Item:{tag:{pages:["default"]}}}] as @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] at @s run tp @s ~ ~ ~ 0 0
execute if entity @s[nbt={Item:{tag:{pages:["no gravity"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] {NoGravity:1}
execute if entity @s[nbt={Item:{tag:{pages:["no gravity"]}}}] if entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] run tag @s add gm4_stand_changed
execute if entity @s[nbt={Item:{tag:{pages:["gravity"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] {NoGravity:0}
execute if entity @s[nbt={Item:{tag:{pages:["arms"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] {ShowArms:1}
execute if entity @s[nbt={Item:{tag:{pages:["arms"]}}}] if entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] run tag @s add gm4_stand_changed
execute if entity @s[nbt={Item:{tag:{pages:["no arms"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] {ShowArms:0}
execute if entity @s[nbt={Item:{tag:{pages:["small"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] {Small:1}
execute if entity @s[nbt={Item:{tag:{pages:["small"]}}}] if entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] run tag @s add gm4_stand_changed
execute if entity @s[nbt={Item:{tag:{pages:["tall"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] {Small:0}
execute if entity @s[nbt={Item:{tag:{pages:["no base"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] {NoBasePlate:1}
execute if entity @s[nbt={Item:{tag:{pages:["no base"]}}}] if entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] run tag @s add gm4_stand_changed
execute if entity @s[nbt={Item:{tag:{pages:["base"]}}}] run data merge entity @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] {NoBasePlate:0}

execute if entity @s[nbt={Item:{tag:{pages:["turn left"]}}}] run tag @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] add gm4_turn_clockwise
execute if entity @s[nbt={Item:{tag:{pages:["turn left"]}}}] run tag @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] remove gm4_turn_anticlockwise
execute if entity @s[nbt={Item:{tag:{pages:["turn right"]}}}] run tag @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] add gm4_turn_anticlockwise
execute if entity @s[nbt={Item:{tag:{pages:["turn right"]}}}] run tag @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] remove gm4_turn_clockwise
execute if entity @s[nbt={Item:{tag:{pages:["no turn"]}}}] run tag @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] remove gm4_turn_clockwise
execute if entity @s[nbt={Item:{tag:{pages:["no turn"]}}}] run tag @e[limit=1,distance=..1,type=armor_stand,tag=!gm4_no_edit] remove gm4_turn_anticlockwise

execute if entity @s[tag=gm4_stand_changed] run advancement grant @a[distance=..4] only gm4:better_armor_stands
tag @s[tag=gm4_stand_changed] remove gm4_stand_changed
