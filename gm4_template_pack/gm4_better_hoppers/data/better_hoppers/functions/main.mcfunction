#run from pulse_check

execute as @e[type=#better_hoppers:projectile] at @s if block ~ ~-.68750 ~ hopper if entity @s[nbt={inBlockState:{Name: "minecraft:hopper"}}] run function better_hoppers:projectile