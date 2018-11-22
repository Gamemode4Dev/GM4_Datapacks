#
# Description:	Apply changes to nearest armour stand according to the player's gm4_as_trigger score
# Called by:	master_armor_stands:pulse_check
# Entity @s:	player
#
# Armour stand settings
#
execute if entity @s[scores={gm4_as_trigger=1}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {NoBasePlate:0b}
execute if entity @s[scores={gm4_as_trigger=2}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {NoBasePlate:1b}
execute if entity @s[scores={gm4_as_trigger=3}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {ShowArms:1b}
execute if entity @s[scores={gm4_as_trigger=4}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {ShowArms:0b}
execute if entity @s[scores={gm4_as_trigger=5}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Small:1b}
execute if entity @s[scores={gm4_as_trigger=6}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Small:0b}
execute if entity @s[scores={gm4_as_trigger=7}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {NoGravity:0b}
execute if entity @s[scores={gm4_as_trigger=8}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {NoGravity:1b}
execute if entity @s[scores={gm4_as_trigger=9}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Invisible:0b}
execute if entity @s[scores={gm4_as_trigger=10}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Invisible:1b}
execute if entity @s[scores={gm4_as_trigger=11}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {CustomNameVisible:1b}
execute if entity @s[scores={gm4_as_trigger=12}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {CustomNameVisible:0b}
#
# Basic poses
#
execute if entity @s[scores={gm4_as_trigger=20}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[0.0f,0.001f,0.0f],Body:[0.0f,0.001f,0.0f],RightArm:[0.0f,0.0f,0.0f],LeftArm:[0.0f,0.0f,0.0f],RightLeg:[0.0f,0.0f,0.0f],LeftLeg:[0.0f,0.0f,0.0f]}}
execute if entity @s[scores={gm4_as_trigger=21}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[0.0f,0.001f,0.0f],Body:[0.0f,0.001f,0.0f],RightArm:[20.0f,0.0f,10.0f],LeftArm:[-20.0f,0.0f,-10.0f],RightLeg:[-20.0f,0.0f,0.0f],LeftLeg:[20.0f,0.0f,0.0f]}}
execute if entity @s[scores={gm4_as_trigger=22}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[0.0f,0.001f,0.0f],Body:[0.0f,0.001f,0.0f],RightArm:[-40.0f,0.0f,10.0f],LeftArm:[40.0f,0.0f,-10.0f],RightLeg:[40.0f,0.0f,0.0f],LeftLeg:[-40.0f,0.0f,0.0f]}}
execute if entity @s[scores={gm4_as_trigger=23}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[0.0f,20.0f,0.0f],Body:[0.0f,0.001f,0.0f],RightArm:[-90.0f,18.0f,0.0f],LeftArm:[0.0f,0.0f,-10.0f],RightLeg:[0.0f,0.0f,0.0f],LeftLeg:[0.0f,0.0f,0.0f]}}
execute if entity @s[scores={gm4_as_trigger=24}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[0.0f,0.001f,0.0f],Body:[0.0f,0.001f,0.0f],RightArm:[-20.0f,-20.0f,0.0f],LeftArm:[-50.0f,50.0f,0.0f],RightLeg:[-20.0f,0.0f,0.0f],LeftLeg:[20.0f,0.0f,0.0f]}}
execute if entity @s[scores={gm4_as_trigger=25}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[0.0f,0.001f,0.0f],Body:[15.0f,0.0f,0.0f],RightArm:[-60.0f,-10.0f,0.0f],LeftArm:[10.0f,0.0f,-10.0f],RightLeg:[-15.0f,0.0f,0.0f],LeftLeg:[30.0f,0.0f,0.0f]}}
execute if entity @s[scores={gm4_as_trigger=26}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[-15.0f,0.0f,0.0f],Body:[0.0f,0.001f,0.0f],RightArm:[-120.0f,-10.0f,0.0f],LeftArm:[10.0f,0.0f,-10.0f],RightLeg:[0.0f,0.0f,0.0f],LeftLeg:[15.0f,0.0f,0.0f]}}
execute if entity @s[scores={gm4_as_trigger=27}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[0.0f,0.001f,0.0f],Body:[0.0f,0.001f,0.0f],RightArm:[-80.0f,20.0f,0.0f],LeftArm:[-80.0f,-20.0f,0.0f],RightLeg:[-85.0f,20.0f,0.0f],LeftLeg:[-85.0f,-20.0f,0.0f]}}
execute if entity @s[scores={gm4_as_trigger=28}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[-15.0f,0.0f,0.0f],Body:[10.0f,0.0f,0.0f],RightArm:[-140.0f,-10.0f,0.0f],LeftArm:[70.0f,0.0f,-10.0f],RightLeg:[0.0f,0.0f,0.0f],LeftLeg:[75.0f,0.0f,0.0f]}}
execute if entity @s[scores={gm4_as_trigger=29}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[0.0f,0.001f,0.0f],Body:[10.0f,0.0f,0.0f],RightArm:[-90.0f,-10.0f,0.0f],LeftArm:[-75.0f,0.0f,10.0f],RightLeg:[0.0f,0.0f,0.0f],LeftLeg:[75.0f,0.0f,0.0f]}}
#
execute if entity @s[scores={gm4_as_trigger=30}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[-10.0f,20.0f,0.0f],Body:[-2.0f,0.0f,0.0f],RightArm:[5.0f,0.0f,0.0f],LeftArm:[5.0f,0.0f,0.0f],RightLeg:[16.0f,2.0f,10.0f],LeftLeg:[0.0f,-10.0f,-4.0f]}}
execute if entity @s[scores={gm4_as_trigger=31}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[0.0f,0.001f,0.0f],Body:[5.0f,0.0f,0.0f],RightArm:[-124.0f,-51.0f,-35.0f],LeftArm:[29.0f,0.0f,25.0f],RightLeg:[0.0f,-4.0f,-2.0f],LeftLeg:[0.0f,4.0f,2.0f]}}
execute if entity @s[scores={gm4_as_trigger=32}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[-90.0f,0.0f,0.0f],Body:[-60.0f,0.0f,0.0f],RightArm:[-120.0f,0.0f,0.0f],LeftArm:[-117.0f,0.0f,0.0f],RightLeg:[0.0f,0.0f,0.0f],LeftLeg:[0.0f,0.0f,0.0f]}}
execute if entity @s[scores={gm4_as_trigger=33}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[45.0f,-4.0f,1.0f],Body:[10.0f,0.0f,0.0f],RightArm:[18.0f,-14.0f,0.0f],LeftArm:[-72.0f,24.0f,47.0f],RightLeg:[25.0f,-2.0f,0.0f],LeftLeg:[-4.0f,-6.0f,-2.0f]}}
execute if entity @s[scores={gm4_as_trigger=34}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[14.0f,-12.0f,6.0f],Body:[5.0f,0.0f,0.0f],RightArm:[-40.0f,20.0f,0.0f],LeftArm:[-4.0f,-20.0f,-10.0f],RightLeg:[-88.0f,71.0f,0.0f],LeftLeg:[-88.0f,46.0f,0.0f]}}
execute if entity @s[scores={gm4_as_trigger=35}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[0.0f,30.0f,0f],Body:[0.0f,13.0f,0.0f],RightArm:[-22.0f,31.0f,10.0f],LeftArm:[145.0f,22.0f,-49.0f],RightLeg:[6.0f,-20.0f,0.0f],LeftLeg:[-6.0f,0.0f,0.0f]}}
execute if entity @s[scores={gm4_as_trigger=36}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[4.0f,0.0f,0.0f],Body:[4.0f,0.0f,0.0f],RightArm:[30.0f,22.0f,-20.0f],LeftArm:[30.0f,-20.0f,21.0f],RightLeg:[0.0f,0.0f,5.0f],LeftLeg:[0.0f,0.0f,-5.0f]}}
execute if entity @s[scores={gm4_as_trigger=37}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[63.0f,0.0f,0.0f],Body:[10.0f,0.0f,0.0f],RightArm:[-5.0f,0.0f,5.0f],LeftArm:[-5.0f,0.0f,-5.0f],RightLeg:[-5.0f,-10.0f,5.0f],LeftLeg:[-5.0f,16.0f,-5.0f]}}
execute if entity @s[scores={gm4_as_trigger=38}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[-11.0f,0.0f,0.0f],Body:[-4.0f,0.0f,0.0f],RightArm:[0.0f,0.0f,100.0f],LeftArm:[0.0f,0.0f,-100.0f],RightLeg:[-8.0f,0.0f,60.0f],LeftLeg:[-8.0f,0.0f,-60.0f]}}
execute if entity @s[scores={gm4_as_trigger=39}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run data merge entity @s {Pose:{Head:[-22.0f,25.0f,0.0f],Body:[-4.0f,10.0f,0.0f],RightArm:[-153.0f,34.0f,-3.0f],LeftArm:[4.0f,18.0f,0.0f],RightLeg:[-4.0f,17.0f,2.0f],LeftLeg:[6.0f,24.0f,0.0f]}}
#
# Nudge position
#
execute if entity @s[scores={gm4_as_trigger=40}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] at @s run tp @s ~-0.5 ~ ~
execute if entity @s[scores={gm4_as_trigger=41}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] at @s run tp @s ~-0.1 ~ ~
execute if entity @s[scores={gm4_as_trigger=42}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] at @s run tp @s ~0.1 ~ ~
execute if entity @s[scores={gm4_as_trigger=43}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] at @s run tp @s ~0.5 ~ ~
execute if entity @s[scores={gm4_as_trigger=44}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] at @s run tp @s ~ ~-0.5 ~
execute if entity @s[scores={gm4_as_trigger=45}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] at @s run tp @s ~ ~-0.1 ~
execute if entity @s[scores={gm4_as_trigger=46}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] at @s run tp @s ~ ~0.1 ~
execute if entity @s[scores={gm4_as_trigger=47}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] at @s run tp @s ~ ~0.5 ~
execute if entity @s[scores={gm4_as_trigger=48}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] at @s run tp @s ~ ~ ~-0.5
execute if entity @s[scores={gm4_as_trigger=49}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] at @s run tp @s ~ ~ ~-0.1
execute if entity @s[scores={gm4_as_trigger=50}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] at @s run tp @s ~ ~ ~0.1
execute if entity @s[scores={gm4_as_trigger=51}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] at @s run tp @s ~ ~ ~0.5
#
# Adjust rotation
#
execute if entity @s[scores={gm4_as_trigger=52..55}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Rotation[0] 1
execute if entity @s[scores={gm4_as_trigger=52}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 45
execute if entity @s[scores={gm4_as_trigger=53}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 5
execute if entity @s[scores={gm4_as_trigger=54}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 5
execute if entity @s[scores={gm4_as_trigger=55}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 45
execute if entity @s[scores={gm4_as_trigger=52..55}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Rotation[0] float 1 run scoreboard players get @s gm4_as_pose
#
# Apply bugfix for MC-80975 if pose is being adjusted
#
execute if entity @s[scores={gm4_as_trigger=60..95}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run function gm4_as_statue:bugfix
#
# Adjust pose...
#
# Head: 60-65
#
execute if entity @s[scores={gm4_as_trigger=60..61}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.Head[0] 1000
execute if entity @s[scores={gm4_as_trigger=60}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=61}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=60..61}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.Head[0] float 0.001 run scoreboard players get @s gm4_as_pose
#
execute if entity @s[scores={gm4_as_trigger=62..63}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.Head[1] 1000
execute if entity @s[scores={gm4_as_trigger=62}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=63}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=62..63}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.Head[1] float 0.001 run scoreboard players get @s gm4_as_pose
#
execute if entity @s[scores={gm4_as_trigger=64..65}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.Head[2] 1000
execute if entity @s[scores={gm4_as_trigger=64}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=65}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=64..65}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.Head[2] float 0.001 run scoreboard players get @s gm4_as_pose
#
# Body: 66-71
#
execute if entity @s[scores={gm4_as_trigger=66..67}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.Body[0] 1000
execute if entity @s[scores={gm4_as_trigger=66}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=67}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=66..67}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.Body[0] float 0.001 run scoreboard players get @s gm4_as_pose
#
execute if entity @s[scores={gm4_as_trigger=68..69}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.Body[1] 1000
execute if entity @s[scores={gm4_as_trigger=68}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=69}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=68..69}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.Body[1] float 0.001 run scoreboard players get @s gm4_as_pose
#
execute if entity @s[scores={gm4_as_trigger=70..71}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.Body[2] 1000
execute if entity @s[scores={gm4_as_trigger=70}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=71}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=70..71}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.Body[2] float 0.001 run scoreboard players get @s gm4_as_pose
#
# Right Arm: 72-77
#
execute if entity @s[scores={gm4_as_trigger=72..73}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.RightArm[0] 1000
execute if entity @s[scores={gm4_as_trigger=72}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=73}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=72..73}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.RightArm[0] float 0.001 run scoreboard players get @s gm4_as_pose
#
execute if entity @s[scores={gm4_as_trigger=74..75}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.RightArm[1] 1000
execute if entity @s[scores={gm4_as_trigger=74}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=75}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=74..75}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.RightArm[1] float 0.001 run scoreboard players get @s gm4_as_pose
#
execute if entity @s[scores={gm4_as_trigger=76..77}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.RightArm[2] 1000
execute if entity @s[scores={gm4_as_trigger=76}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=77}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=76..77}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.RightArm[2] float 0.001 run scoreboard players get @s gm4_as_pose
#
# Left Arm: 78-83
#
execute if entity @s[scores={gm4_as_trigger=78..79}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.LeftArm[0] 1000
execute if entity @s[scores={gm4_as_trigger=78}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=79}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=78..79}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.LeftArm[0] float 0.001 run scoreboard players get @s gm4_as_pose
#
execute if entity @s[scores={gm4_as_trigger=80..81}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.LeftArm[1] 1000
execute if entity @s[scores={gm4_as_trigger=80}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=81}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=80..81}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.LeftArm[1] float 0.001 run scoreboard players get @s gm4_as_pose
#
execute if entity @s[scores={gm4_as_trigger=82..83}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.LeftArm[2] 1000
execute if entity @s[scores={gm4_as_trigger=82}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=83}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=82..83}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.LeftArm[2] float 0.001 run scoreboard players get @s gm4_as_pose
#
# Right Leg: 84-89
#
execute if entity @s[scores={gm4_as_trigger=84..85}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.RightLeg[0] 1000
execute if entity @s[scores={gm4_as_trigger=84}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=85}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=84..85}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.RightLeg[0] float 0.001 run scoreboard players get @s gm4_as_pose
#
execute if entity @s[scores={gm4_as_trigger=86..87}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.RightLeg[1] 1000
execute if entity @s[scores={gm4_as_trigger=86}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=87}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=86..87}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.RightLeg[1] float 0.001 run scoreboard players get @s gm4_as_pose
#
execute if entity @s[scores={gm4_as_trigger=88..89}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.RightLeg[2] 1000
execute if entity @s[scores={gm4_as_trigger=88}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=89}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=88..89}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.RightLeg[2] float 0.001 run scoreboard players get @s gm4_as_pose
#
# Left Leg: 90-95
#
execute if entity @s[scores={gm4_as_trigger=90..91}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.LeftLeg[0] 1000
execute if entity @s[scores={gm4_as_trigger=90}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=91}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=90..91}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.LeftLeg[0] float 0.001 run scoreboard players get @s gm4_as_pose
#
execute if entity @s[scores={gm4_as_trigger=92..93}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.LeftLeg[1] 1000
execute if entity @s[scores={gm4_as_trigger=92}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=93}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=92..93}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.LeftLeg[1] float 0.001 run scoreboard players get @s gm4_as_pose
#
execute if entity @s[scores={gm4_as_trigger=94..95}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result score @s gm4_as_pose run data get entity @s Pose.LeftLeg[2] 1000
execute if entity @s[scores={gm4_as_trigger=94}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players add @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=95}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run scoreboard players remove @s gm4_as_pose 10000
execute if entity @s[scores={gm4_as_trigger=94..95}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] store result entity @s Pose.LeftLeg[2] float 0.001 run scoreboard players get @s gm4_as_pose
#
# Give glowing effect for three seconds if checking target
#
execute if entity @s[scores={gm4_as_trigger=999}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run effect give @s minecraft:glowing 3
#
# Add/remove locked tag to prevent accidental changes
#
execute if entity @s[scores={gm4_as_trigger=1000}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_locked] run tag @s add gm4_as_locked
execute if entity @s[scores={gm4_as_trigger=1001}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=gm4_as_locked,tag=!gm4_as_sealed] run effect give @s minecraft:glowing 1
execute if entity @s[scores={gm4_as_trigger=1001}] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=gm4_as_locked,tag=!gm4_as_sealed] run tag @s remove gm4_as_locked
#
# Add/remove sealed tag to prevent any changes (creative mode only)
#
execute if entity @s[scores={gm4_as_trigger=1002},gamemode=creative] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_sealed] run tag @s add gm4_as_locked
execute if entity @s[scores={gm4_as_trigger=1002},gamemode=creative] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_sealed] run data merge entity @s {Invulnerable:1b,DisabledSlots:2039583}
execute if entity @s[scores={gm4_as_trigger=1002},gamemode=creative] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=!gm4_as_sealed] run tag @s add gm4_as_sealed
#
execute if entity @s[scores={gm4_as_trigger=1003},gamemode=creative] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=gm4_as_sealed] run effect give @s minecraft:glowing 1
execute if entity @s[scores={gm4_as_trigger=1003},gamemode=creative] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=gm4_as_sealed] run tag @s remove gm4_as_locked
execute if entity @s[scores={gm4_as_trigger=1003},gamemode=creative] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=gm4_as_sealed] run data merge entity @s {Invulnerable:0b,DisabledSlots:0}
execute if entity @s[scores={gm4_as_trigger=1003},gamemode=creative] as @e[type=armor_stand,distance=..3,limit=1,sort=nearest,tag=gm4_as_sealed] run tag @s remove gm4_as_sealed
#
# Reset trigger score and re-enable
#
scoreboard players set @s gm4_as_trigger 0
scoreboard players enable @s gm4_as_trigger
