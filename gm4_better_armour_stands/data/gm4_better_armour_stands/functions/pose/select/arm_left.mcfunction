# @s = armor_stand to be modified
# at @s
# run from pose/select

scoreboard players set @s gm4_bas_mode 3

tag @s add gm4_bas_track
tag @p[tag=gm4_bas_active] add gm4_bas_track

# right click detection
summon minecraft:villager ~ ~-1000 ~ {Tags:["gm4_bas_detect"],Team:"gm4_bas",Silent:1b,NoAI:1b,ActiveEffects:[{Id:14b,Amplifier:0b,Duration:10000000,ShowParticles:0b}]}
execute positioned ~ ~-1000 ~ run tp @e[type=villager,tag=gm4_bas_detect,distance=..1,sort=nearest,limit=1] @p[tag=gm4_bas_active] 

# spawn markers
execute at @p[tag=gm4_bas_active] positioned ~ ~1.6 ~ run summon marker ^ ^ ^2 {CustomName:'"gm4_bas_player_offset"',Tags:["gm4_bas_player_offset","gm4_bas_marker","gm4_bas_new"]}
execute if score @s gm4_bas_data matches 0 positioned ~ ~1.4 ~ run summon marker ^.3 ^ ^ {CustomName:'"gm4_bas_left_arm"',Tags:["gm4_bas_joint","gm4_bas_left_arm","gm4_bas_marker","gm4_bas_new"]}
execute if score @s gm4_bas_data matches 1 positioned ~ ~.7 ~ run summon marker ^.15 ^ ^ {CustomName:'"gm4_bas_left_arm"',Tags:["gm4_bas_joint","gm4_bas_left_arm","gm4_bas_marker","gm4_bas_new"]}

# mirror/invert check
execute if data storage gm4_better_armour_stands:temp {pages:["mirror"]} run tag @s add gm4_bas_mirror
execute if data storage gm4_better_armour_stands:temp {pages:["invert"]} run tag @s add gm4_bas_invert
