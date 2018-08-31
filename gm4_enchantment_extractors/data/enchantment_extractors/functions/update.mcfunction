execute unless block ~ ~ ~ dropper run function enchantment_extractors:destroy
particle portal ~ ~1.5 ~ 0 0 0 .5 1
execute if block ~ ~ ~ dropper{Items:[]} positioned ~ ~1 ~ as @e[type=item,distance=..0.7,nbt={Item:{Count:1b,tag:{Enchantments:[{}]}}}] positioned ~ ~-1 ~ run function enchantment_extractors:extract
data merge entity @s {Fire:2000}
