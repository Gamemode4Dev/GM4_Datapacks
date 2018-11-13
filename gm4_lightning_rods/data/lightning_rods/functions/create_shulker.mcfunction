setblock ~ ~-1 ~ air
summon shulker ~ ~-1 ~ {ActiveEffects:[{Id:10b,Duration:20,Amplifier:10b,ShowParticles:0b}],Color:15,DeathLootTable:"lightning_rods:shulker"}
advancement grant @a[distance=..5,gamemode=!spectator] only gm4:lightning_rods_shulker
