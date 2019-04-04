# @s = saddle on a stair block
execute if block ~ ~ ~ #minecraft:stairs[facing=north] align xyz run summon pig ~.5 ~-.39 ~.69 {NoAI:1,Saddle:1,NoGravity:1,Silent:1,Invulnerable:1,Tags:["gm4_chairs"],Rotation:[0.0f,0.0f],DeathTime:19,Attributes:[{Name:"generic.maxHealth",Base:1.0},{Name:"generic.movementSpeed",Base:0.0}],ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}
execute if block ~ ~ ~ #minecraft:stairs[facing=east] align xyz run summon pig ~.31 ~-.39 ~.5 {NoAI:1,Saddle:1,NoGravity:1,Silent:1,Invulnerable:1,Tags:["gm4_chairs"],Rotation:[90.0f,0.0f],DeathTime:19,Attributes:[{Name:"generic.maxHealth",Base:1.0},{Name:"generic.movementSpeed",Base:0.0}],ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}
execute if block ~ ~ ~ #minecraft:stairs[facing=south] align xyz run summon pig ~.5 ~-.39 ~.31 {NoAI:1,Saddle:1,NoGravity:1,Silent:1,Invulnerable:1,Tags:["gm4_chairs"],Rotation:[180.0f,0.0f],DeathTime:19,Attributes:[{Name:"generic.maxHealth",Base:1.0},{Name:"generic.movementSpeed",Base:0.0}],ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}
execute if block ~ ~ ~ #minecraft:stairs[facing=west] align xyz run summon pig ~.69 ~-.39 ~.5 {NoAI:1,Saddle:1,NoGravity:1,Silent:1,Invulnerable:1,Tags:["gm4_chairs"],Rotation:[-90.0f,0.0f],DeathTime:19,Attributes:[{Name:"generic.maxHealth",Base:1.0},{Name:"generic.movementSpeed",Base:0.0}],ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}
execute run team join gm4_chairs @e[tag=gm4_chairs,distance=..2]
playsound minecraft:block.wool.place block @a[distance=..5] ~ ~ ~ 1 2

#advancement
advancement grant @a[distance=..5,gamemode=!spectator] only gm4:chairs

#kill the saddle item
kill @s
