#run from main
# @s = saddle item on top of stairs

execute if block ~ ~ ~ #minecraft:stairs[facing=north] align xyz run summon minecraft:pig ~.5 ~-.39 ~.55 {Tags:["gm4_chairs"],Team:"gm4_chairs",NoAI:1b,Saddle:1b,NoGravity:1b,Silent:1b,DeathTime:19s,InLove:2147483647,Rotation:[0.0f,0.0f],Attributes:[{Name:"generic.max_health",Base:1.0},{Name:"generic.movement_speed",Base:0.0}],ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b},{Id:11b,Amplifier:10b,Duration:2147483647,ShowParticles:0b}],DeathLootTable:"minecraft:empty"}
execute if block ~ ~ ~ #minecraft:stairs[facing=east] align xyz run summon minecraft:pig ~.45 ~-.39 ~.5 {Tags:["gm4_chairs"],Team:"gm4_chairs",NoAI:1b,Saddle:1b,NoGravity:1b,Silent:1b,DeathTime:19s,InLove:2147483647,Rotation:[90.0f,0.0f],Attributes:[{Name:"generic.max_health",Base:1.0},{Name:"generic.movement_speed",Base:0.0}],ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b},{Id:11b,Amplifier:10b,Duration:2147483647,ShowParticles:0b}],DeathLootTable:"minecraft:empty"}
execute if block ~ ~ ~ #minecraft:stairs[facing=south] align xyz run summon minecraft:pig ~.5 ~-.39 ~.45 {Tags:["gm4_chairs"],Team:"gm4_chairs",NoAI:1b,Saddle:1b,NoGravity:1b,Silent:1b,DeathTime:19s,InLove:2147483647,Rotation:[180.0f,0.0f],Attributes:[{Name:"generic.max_health",Base:1.0},{Name:"generic.movement_speed",Base:0.0}],ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b},{Id:11b,Amplifier:10b,Duration:2147483647,ShowParticles:0b}],DeathLootTable:"minecraft:empty"}
execute if block ~ ~ ~ #minecraft:stairs[facing=west] align xyz run summon minecraft:pig ~.55 ~-.39 ~.5 {Tags:["gm4_chairs"],Team:"gm4_chairs",NoAI:1b,Saddle:1b,NoGravity:1b,Silent:1b,DeathTime:19s,InLove:2147483647,Rotation:[-90.0f,0.0f],Attributes:[{Name:"generic.max_health",Base:1.0},{Name:"generic.movement_speed",Base:0.0}],ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b},{Id:11b,Amplifier:10b,Duration:2147483647,ShowParticles:0b}],DeathLootTable:"minecraft:empty"}
playsound minecraft:block.wool.place block @a[distance=..5] ~ ~ ~ 1 2

# advancement for creating a chair
advancement grant @a[distance=..3,gamemode=!spectator] only gm4:chairs_creation

# kill the saddle item
kill @s
