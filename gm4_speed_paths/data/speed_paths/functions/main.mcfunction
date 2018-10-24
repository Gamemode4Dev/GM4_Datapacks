execute as @a at @s if block ~ ~-0.5 ~ #speed_paths:is_path unless entity @s[nbt={ActiveEffects:[{Id:"minecraft:speed",ShowParticles:1b}]}] run effect give @s speed 1 0 true
execute as @a at @s if block ~ ~-0.5 ~ #speed_paths:is_path run advancement grant @s only gm4:speed_paths
