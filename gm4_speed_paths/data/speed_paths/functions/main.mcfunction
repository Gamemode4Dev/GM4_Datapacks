execute as @a at @s if block ~ ~-0.9 ~ grass_path unless entity @s[nbt={ActiveEffects:[{Id:1b,ShowParticles:1b}]}] run effect give @s speed 2 0 true
