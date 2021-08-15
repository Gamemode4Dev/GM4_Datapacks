# @s = armor_stand to be modified
# at @s
# run from apply_pose

scoreboard players set @s gm4_bas_mode 2

tag @s add gm4_bas_track
tag @p[tag=gm4_bas_active] add gm4_bas_track

# right click detection
summon minecraft:villager ~ ~-1000 ~ {Tags:["gm4_bas_detect"],Team:"gm4_bas",Silent:1b,NoAI:1b,ActiveEffects:[{Id:14b,Amplifier:0b,Duration:10000000,ShowParticles:0b}]}
execute positioned ~ ~-1000 ~ run tp @e[type=villager,tag=gm4_bas_detect,distance=..1,sort=nearest,limit=1] @p[tag=gm4_bas_active] 

# spawn markers
execute at @p[tag=gm4_bas_active] positioned ~ ~1.6 ~ run summon marker ^ ^ ^2 {Tags:["gm4_bas_tracker"]}
summon marker ~ ~1.5 ~ {Tags:["gm4_bas_joint","gm4_bas_body"]}
