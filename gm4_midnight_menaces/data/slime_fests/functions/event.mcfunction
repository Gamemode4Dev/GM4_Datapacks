#@s = none
#at world spawn
#called by mysterious menaces base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

execute as @e[type=item,nbt={Item:{id:"minecraft:slime_ball"},OnGround:1b}] run function slime_fests:mark_slime_ball
execute as @e[type=item,scores={gm4_reslimify=8..}] at @s run function slime_fests:spawn_slime

execute as @e[type=creeper,nbt={PersistenceRequired:0b}] at @s run function slime_fests:slime_transform
execute as @e[type=spider,nbt={PersistenceRequired:0b}] at @s run function slime_fests:slime_transform

scoreboard players reset @e[type=slime] gm4_menace
execute at @e[type=slime] run scoreboard players add @e[type=slime,distance=..5] gm4_menace 1

execute as @e[type=slime,nbt={Size:0}] at @s if entity @e[type=slime,distance=0.1..2,limit=1,tag=!gm4_just_grew] run function slime_fests:merge_slimes