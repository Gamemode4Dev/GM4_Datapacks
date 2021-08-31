# Summon pufferfish
# @s = player using the crossbow
# at @s
# run from projectile/bucket

# summon pufferfish at player's location
summon minecraft:pufferfish ~ ~1.2 ~ {FromBucket:1b,Tags:["gm4_cb_proj"],ActiveEffects:[{Id:10,Amplifier:10,Duration:200,ShowParticles:0b}]}

# fish flop sound
playsound minecraft:entity.puffer_fish.flop player @a[distance=..15] ~ ~ ~ 2 .5
