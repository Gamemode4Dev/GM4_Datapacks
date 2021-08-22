# @s = armor_stand to be modified
# at @s
# run from pose/select

playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1

tag @s add gm4_bas_modified
tag @s add gm4_bas_track
tag @p[tag=gm4_bas_active] add gm4_bas_track

# right click detection
summon minecraft:villager ~ ~-1000 ~ {CustomName:'"gm4_bas_detect_rightclick"',Tags:["gm4_bas_detect","gm4_bas_new"],Team:"gm4_bas",Silent:1b,NoAI:1b,Invulnerable:1b,ActiveEffects:[{Id:14b,Amplifier:0b,Duration:10000000,ShowParticles:0b}]}
execute positioned ~ ~-1000 ~ run tp @e[type=villager,tag=gm4_bas_detect,distance=..1,sort=nearest,limit=1] @p[tag=gm4_bas_active] 

# player offset marker
execute at @p[tag=gm4_bas_active] positioned ~ ~1.6 ~ run summon marker ^ ^ ^2 {CustomName:'"gm4_bas_player_offset"',Tags:["gm4_bas_player_offset","gm4_bas_marker","gm4_bas_new"]}

# copy player id to entities
execute if score @s gm4_bas_mode matches 1.. run scoreboard players operation @e[type=villager,tag=gm4_bas_new,distance=..5] gm4_bas_id = @s gm4_bas_id
tag @e[type=villager,tag=gm4_bas_new,distance=..5] remove gm4_bas_new

execute if score @s gm4_bas_mode matches 1.. run scoreboard players operation @e[type=marker,tag=gm4_bas_new,distance=..5] gm4_bas_id = @s gm4_bas_id
tag @e[type=marker,tag=gm4_bas_new,distance=..5] remove gm4_bas_new

# optional checks
execute if score $pose_options gm4_bas_mode matches 2..5 unless score $pose_options gm4_bas_mode matches 3 run tag @s add gm4_bas_mirror
execute if score $pose_options gm4_bas_mode matches 3..5 run tag @s add gm4_bas_invert
execute if entity @p[tag=gm4_bas_active,predicate=gm4_better_armour_stands:sneaking] run tag @s add gm4_bas_alt
