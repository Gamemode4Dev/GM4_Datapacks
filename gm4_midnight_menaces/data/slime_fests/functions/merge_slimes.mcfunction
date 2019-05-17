#@s = slime with Size:0 if there are any nearby slimes
#at @s
#called by event

execute as @e[type=slime,nbt={Size:1},scores={gm4_menace=..8},limit=1,sort=random] at @s run data merge entity @e[type=slime,distance=0.1..2,sort=nearest,limit=1,nbt={Size:3},tag=!gm4_just_grew] {Size:7,Tags:[gm4_just_grew],DeathLootTable:"slime_fests:giant_slime"}
execute as @e[type=slime,nbt={Size:1},scores={gm4_menace=..8},limit=1,sort=random] at @s run data merge entity @e[type=slime,distance=0.1..2,sort=nearest,limit=1,nbt={Size:1},tag=!gm4_just_grew] {Size:3,Tags:[gm4_just_grew]}
execute as @e[type=slime,nbt={Size:0},scores={gm4_menace=..8},limit=1,sort=random] at @s run data merge entity @e[type=slime,distance=0.1..2,sort=nearest,limit=1,nbt={Size:0},tag=!gm4_just_grew] {Size:1,Tags:[gm4_just_grew]}

execute as @e[type=slime,tag=gm4_just_grew,scores={gm4_menace=..8},nbt={Size:1}] at @s run teleport @e[type=slime,distance=0.1..3,sort=nearest,limit=1,nbt={Size:0}] @s
execute as @e[type=slime,tag=gm4_just_grew,scores={gm4_menace=..8},nbt={Size:3}] at @s run teleport @e[type=slime,distance=0.1..3,sort=nearest,limit=1,nbt={Size:1}] @s
execute as @e[type=slime,tag=gm4_just_grew,scores={gm4_menace=..8},nbt={Size:7}] at @s run teleport @e[type=slime,distance=0.1..3,sort=nearest,limit=1,nbt={Size:3}] @s

execute at @e[type=slime,tag=gm4_just_grew] as @e[type=slime,tag=!gm4_just_grew,distance=0,limit=1] at @s run function slime_fests:complete_merge

tag @e[tag=gm4_just_grew] remove gm4_just_grew
