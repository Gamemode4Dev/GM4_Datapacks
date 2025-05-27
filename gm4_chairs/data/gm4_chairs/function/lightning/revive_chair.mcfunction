# Replace zombified piglin with chair
# @s = zombified piglin that replaced the pig/chair
# at @s
# runs from lightning/delay

# spawn chair
summon minecraft:pig ~ ~-10000 ~ {Tags:["gm4_chairs","smithed.entity","smithed.strict","smithed.block"],Team:"gm4_chairs",NoAI:1b,equipment:{saddle:{id:"minecraft:saddle"}},NoGravity:1b,Silent:1b,DeathTime:19s,InLove:2147483647,attributes:[{id:"minecraft:movement_speed",base:0.0}],active_effects:[{id:'minecraft:invisibility',amplifier:0,duration:2147483647,show_particles:0b},{id:'minecraft:resistance',amplifier:10b,duration:2147483647,show_particles:0b}],DeathLootTable:"gm4:empty"}
execute positioned ~ ~-10000 ~ run scoreboard players set @e[type=pig,tag=gm4_chairs,limit=1,distance=..0.1] gm4_entity_version 1

# copy zombified piglin rotation
execute rotated as @s positioned ~ ~-10000 ~ run tp @e[type=minecraft:pig,tag=gm4_chairs,distance=..0.4,limit=1] ~ ~10000 ~ ~ ~

# kill zombified piglin
tp @s ~ -10000 ~
