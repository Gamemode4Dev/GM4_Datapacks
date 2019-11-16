#run from projectile
#@s = arrow/spectral arrow on a hopper, at @s

execute if entity @s[type=arrow] unless data entity @s Potion run function better_hoppers:arrow
execute if entity @s[type=spectral_arrow] run function better_hoppers:spectral_arrow
execute if entity @s[type=trident, nbt=!{Trident:{tag:{Enchantments:[{id:"minecraft:loyalty"}]}}}] unless data block ~ ~-.1 ~ Items[4] run function better_hoppers:trident