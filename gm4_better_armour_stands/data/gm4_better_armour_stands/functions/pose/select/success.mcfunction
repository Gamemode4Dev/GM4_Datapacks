# @s = armor_stand to be modified
# at @s
# run from pose/select

playsound minecraft:entity.armor_stand.fall block @a[distance=..6] ~ ~ ~ 0.5 1

tag @s add gm4_bas_track
tag @a[tag=gm4_bas_active,limit=1] add gm4_bas_track

data modify entity @s DisabledSlots set value 4144959
data modify entity @s[nbt={Invisible:1b}] Glowing set value 1

# right click detection
summon minecraft:wandering_trader ~ ~-10000 ~ {CustomName:'"gm4_bas_detect_click"',Tags:["smithed.entity","smithed.strict","gm4_trader","gm4_bas_detect","gm4_bas_new","gm4_bas_temp"],Team:"gm4_bas",NoAI:1b,Silent:1b,Health:1f,Offers:{},ActiveEffects:[{Id:14,Amplifier:0b,Duration:10000000,ShowParticles:0b},{Id:11,Amplifier:10b,Duration:10000000,ShowParticles:0b}]}
tp @e[type=wandering_trader,tag=gm4_bas_new,limit=1] ~ ~ ~ 

# spawn marker for player offset and current armour stand data
summon marker ~ ~ ~ {CustomName:'"gm4_bas_player_offset"',Tags:["smithed.entity","smithed.strict","gm4_bas_player_offset","gm4_bas_marker","gm4_bas_new","gm4_bas_temp"]}
data modify entity @e[type=minecraft:marker,tag=gm4_bas_player_offset,tag=gm4_bas_new,distance=..1,limit=1] data set from storage gm4_better_armour_stands:temp Data
data remove storage gm4_better_armour_stands:temp Data

# copy player id to entities
execute if score @s gm4_bas_mode matches 1.. run scoreboard players operation @e[type=wandering_trader,tag=gm4_bas_new,distance=..1] gm4_bas_id = @s gm4_bas_id
tag @e[type=wandering_trader,tag=gm4_bas_new,limit=1] remove gm4_bas_new

execute if score @s gm4_bas_mode matches 1.. run scoreboard players operation @e[type=marker,tag=gm4_bas_new,distance=..2] gm4_bas_id = @s gm4_bas_id
tag @e[type=marker,tag=gm4_bas_new,distance=..2,limit=2] remove gm4_bas_new

# optional checks
execute if data storage gm4_better_armour_stands:temp {pages:["pose mirror"]} run tag @s add gm4_bas_mirror
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:sneaking] run tag @s add gm4_bas_alt

# start tracking clock
schedule function gm4_better_armour_stands:pose/track/tick 1t
schedule function gm4_better_armour_stands:pose/check_no_player 16t
