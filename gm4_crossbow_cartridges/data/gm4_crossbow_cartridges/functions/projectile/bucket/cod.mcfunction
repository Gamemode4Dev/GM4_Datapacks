#run from projectile/bucket
# @s = player using the crossbow

#summon cod at player's location
summon minecraft:cod ~ ~1.2 ~ {FromBucket:1b,Tags:["gm4_cb_proj"],ActiveEffects:[{Id:10,Amplifier:10,Duration:200,ShowParticles:0b}]}

#fish flop sound
playsound minecraft:entity.cod.flop player @a[distance=..15] ~ ~ ~ 2 .5
