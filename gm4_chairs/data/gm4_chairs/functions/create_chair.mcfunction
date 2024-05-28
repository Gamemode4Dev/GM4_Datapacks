# Create chair from saddle item
# @s = saddle item on top of stairs
# at @s align xyz positioned ~.5 ~ ~.5
# run from main

# spawn chair
summon minecraft:pig ~ ~-10000.39 ~ {CustomName:'"gm4_chair"',Tags:["gm4_chairs","smithed.entity","smithed.strict","smithed.block"],Team:"gm4_chairs",NoAI:1b,Saddle:1b,NoGravity:1b,Silent:1b,DeathTime:19s,InLove:2147483647,Attributes:[{Name:"generic.max_health",Base:1.0},{Name:"generic.movement_speed",Base:0.0}],active_effects:[{id:'minecraft:invisibility',amplifier:0,duration:2147483647,show_particles:0b},{id:'minecraft:resistance',amplifier:10b,duration:2147483647,show_particles:0b}],DeathLootTable:"minecraft:empty"}

# set chair to orientation of stairs
execute if block ~ ~ ~ #minecraft:stairs[facing=north] positioned ~ ~-10000 ~ as @e[type=minecraft:pig,tag=gm4_chairs,distance=..0.4,limit=1] at @s run tp @s ~ ~10000 ~.05 0 0
execute if block ~ ~ ~ #minecraft:stairs[facing=south] positioned ~ ~-10000 ~ as @e[type=minecraft:pig,tag=gm4_chairs,distance=..0.4,limit=1] at @s run tp @s ~ ~10000 ~-.05 180 0
execute if block ~ ~ ~ #minecraft:stairs[facing=east] positioned ~ ~-10000 ~ as @e[type=minecraft:pig,tag=gm4_chairs,distance=..0.4,limit=1] at @s run tp @s ~-.05 ~10000 ~ 90 0
execute if block ~ ~ ~ #minecraft:stairs[facing=west] positioned ~ ~-10000 ~ as @e[type=minecraft:pig,tag=gm4_chairs,distance=..0.4,limit=1] at @s run tp @s ~.05 ~10000 ~ -90 0

# store saddle data in chair
item replace entity @e[type=minecraft:pig,tag=gm4_chairs,distance=..0.4,limit=1] weapon.mainhand from entity @s contents
scoreboard players set @e[type=minecraft:pig,tag=gm4_chairs,distance=..0.4,limit=1] gm4_entity_version 1

# place sound
playsound minecraft:block.wool.place block @a[distance=..5] ~ ~ ~ .5 2

# advancement for creating a chair
advancement grant @a[distance=..3,gamemode=!spectator] only gm4:chairs_creation

# kill the saddle item
kill @s
