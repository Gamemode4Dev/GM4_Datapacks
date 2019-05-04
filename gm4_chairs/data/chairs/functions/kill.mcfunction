# @s = @e[tag=gm4_chairs] and NOT inside stair blocks
summon fox ~ ~.6 ~ {Age:-1000,NoAI:1,NoGravity:1,Silent:1,Invulnerable:1,Tags:["gm4_chairs_item"],DeathTime:19,ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}],HandItems:[{id:"minecraft:saddle",Count:1b}]}
kill @e[type=fox,tag=gm4_chairs_item,distance=..2]
data merge entity @s {Health:0b}
