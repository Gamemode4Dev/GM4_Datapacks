execute as @a at @s if block ~ ~-0.5 ~ grass_path unless entity @s[nbt={ActiveEffects:[{Id:"minecraft:speed",ShowParticles:1b}]}] run effect give @s speed 1 0 true
