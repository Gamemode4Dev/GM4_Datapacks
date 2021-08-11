#@s = item with vanishing curse to have enchantments extracted
#run from enchantment_extractors:extract

execute as @e[tag=gm4_enchantment_extractor,limit=1,sort=nearest,distance=..0.01] run loot insert ~ ~1 ~ fish gm4_enchantment_extractors:technical/extract/vanishing_curse ~ ~ ~ mainhand
tag @s add gm4_ench_extracted
