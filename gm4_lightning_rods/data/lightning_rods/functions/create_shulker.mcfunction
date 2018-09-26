setblock ~ ~-1 ~ air
summon shulker ~ ~-1 ~ {ActiveEffects:[{Id:10b,Duration:20,Amplifier:10b,ShowParticles:0b}],Color:16,DeathLootTable:"minecraft:empty",HandItems:[{id:"minecraft:shulker_shell",Count:1b,tag:{display:{Name:"\"Charred Shell\"",Lore:["Nice and toasty"]}}}],HandDropChances:[0.1f]}
advancement grant @a[distance=..5,gamemode=!spectator] only gm4:lightning_rods_shulker
