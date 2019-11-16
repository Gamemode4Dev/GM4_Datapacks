#run from projectile
#@s = projectile near a hopper minecart, at ~-1 ~-1.5 ~-1 from projectile

execute if entity @s[type=arrow] unless data entity @s Potion run function better_hoppers:minecart/arrow
execute if entity @s[type=spectral_arrow] run function better_hoppers:minecart/spectral_arrow
execute if entity @s[type=trident, nbt=!{Trident:{tag:{Enchantments:[{id:"minecraft:loyalty"}]}}}] unless data entity @e[dx=1, dy=1.5, dz=1, type=hopper_minecart, nbt={Enabled:1b}, sort=nearest, limit=1] Items[4] run function better_hoppers:minecart/trident