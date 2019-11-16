#run from pulse_check @s = projectile

execute at @s if block ~ ~-.68750 ~ hopper if entity @s[nbt={inBlockState:{Properties: {enabled: "true"}, Name: "minecraft:hopper"}}] run function better_hoppers:projectile
execute at @s positioned ~-.5 ~-1.5 ~-.5 if entity @e[dx=1, dy=1.5, dz=1, type=hopper_minecart, nbt={Enabled:1b}, sort=nearest, limit=1] run function better_hoppers:minecart/projectile