# @s = none
# at world spawn
# called by midnight menaces base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

# resurrecting slimes
execute as @e[type=minecraft:item,x=0,nbt={Item:{id:"minecraft:slime_ball"},OnGround:1b}] run function gm4_slime_fests:mark_slime_ball
execute as @e[type=minecraft:item,scores={gm4_reslimify=8..}] at @s run function gm4_slime_fests:spawn_slime

# slime takeover
execute as @e[type=#gm4_slime_fests:slime_convertable,x=0,tag=!smithed.entity,nbt={PersistenceRequired:0b}] at @s run function gm4_slime_fests:slime_transform

# merging slimes
scoreboard players reset @e[type=minecraft:slime] gm4_menace_data
execute at @e[type=minecraft:slime,x=0,tag=!smithed.entity] run scoreboard players add @e[type=minecraft:slime,tag=!smithed.entity,distance=0.1..5] gm4_menace_data 1
execute as @e[type=minecraft:slime,tag=!gm4_merged_slime,tag=!gm4_giant_slime,scores={gm4_menace_data=1..7},limit=1] at @s if entity @e[type=minecraft:slime,distance=0.1..3,limit=1] run function gm4_slime_fests:merge_slimes
execute as @e[type=minecraft:slime,tag=!gm4_merged_slime,tag=!gm4_giant_slime,scores={gm4_menace_data=1..7},limit=1] at @s if entity @e[type=minecraft:slime,distance=0.1..3,limit=1] run function gm4_slime_fests:merge_slimes
execute as @e[type=minecraft:slime,tag=!gm4_merged_slime,tag=!gm4_giant_slime,scores={gm4_menace_data=1..7},limit=1] at @s if entity @e[type=minecraft:slime,distance=0.1..3,limit=1] run function gm4_slime_fests:merge_slimes
tag @e[type=minecraft:slime] remove gm4_merged_slime
