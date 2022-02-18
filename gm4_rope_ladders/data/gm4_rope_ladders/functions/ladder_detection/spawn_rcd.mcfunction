
summon wandering_trader ~ ~100 ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["gm4_rol_rcd","gm4_rol_rcd_ladder"],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:999999,ShowParticles:0b}],Offers:{}}
execute positioned ~ ~100 ~ run tp @e[type=wandering_trader,tag=gm4_rol_rcd_ladder] ~ ~-100 ~
