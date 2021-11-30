# @s = armor_stand to be modified
# at @s
# run from pose/select

playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1

tag @s add gm4_bas_track
tag @a[tag=gm4_bas_active,limit=1] add gm4_bas_track

data modify entity @s DisabledSlots set value 63
data modify entity @s[nbt={Invisible:1b}] Glowing set value 1

# right click detection
summon minecraft:wandering_trader ~ ~-10000 ~ {CustomName:'"gm4_bas_detect_rightclick"',Tags:["gm4_trader","gm4_bas_detect","gm4_bas_new","gm4_bas_temp"],Team:"gm4_bas",NoAI:1b,Silent:1b,Health:1f,Offers:{},ActiveEffects:[{Id:14b,Amplifier:0b,Duration:10000000,ShowParticles:0b},{Id:11b,Amplifier:10b,Duration:10000000,ShowParticles:0b}]}
execute positioned ~ ~-10000 ~ run tp @e[type=wandering_trader,tag=gm4_bas_detect,distance=..1,sort=nearest,limit=1] @a[tag=gm4_bas_active,limit=1] 

# player offset marker
execute at @a[tag=gm4_bas_active,limit=1] positioned ~ ~1.6 ~ run summon marker ^ ^ ^2 {CustomName:'"gm4_bas_player_offset"',Tags:["gm4_bas_player_offset","gm4_bas_marker","gm4_bas_new","gm4_bas_temp"]}

# store pose, position, or rotation data
execute if score @s gm4_bas_mode matches 1..6 run data modify entity @e[type=minecraft:marker,tag=gm4_bas_player_offset,tag=gm4_bas_new,distance=..5,limit=1] data.Pose set from entity @s Pose
execute if score @s gm4_bas_mode matches 7 run data modify entity @e[type=minecraft:marker,tag=gm4_bas_player_offset,tag=gm4_bas_new,distance=..5,limit=1] data.Pos set from entity @s Pos
execute if score @s gm4_bas_mode matches 8 run data modify entity @e[type=minecraft:marker,tag=gm4_bas_player_offset,tag=gm4_bas_new,distance=..5,limit=1] data.Rotation set from entity @s Rotation

# copy player id to entities
execute if score @s gm4_bas_mode matches 1.. run scoreboard players operation @e[type=wandering_trader,tag=gm4_bas_new,distance=..5] gm4_bas_id = @s gm4_bas_id
tag @e[type=wandering_trader,tag=gm4_bas_new,distance=..5] remove gm4_bas_new

execute if score @s gm4_bas_mode matches 1.. run scoreboard players operation @e[type=marker,tag=gm4_bas_new,distance=..5] gm4_bas_id = @s gm4_bas_id
tag @e[type=marker,tag=gm4_bas_new,distance=..5] remove gm4_bas_new

# optional checks
execute if data storage gm4_better_armour_stands:temp {pages:["pose mirror"]} run tag @s add gm4_bas_mirror
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:sneaking] run tag @s add gm4_bas_alt

# start tracking clock
schedule function gm4_better_armour_stands:pose/track/tick 1t
