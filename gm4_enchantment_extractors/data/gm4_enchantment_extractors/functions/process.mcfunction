#@s = enchantment extractor armor stand
#positioned 1 block above (at the dropper)
#run from main

particle portal ~ ~0.5 ~ 0 0 0 .5 1
execute if block ~ ~ ~ dropper{Items:[]} positioned ~ ~0.7 ~ as @e[type=item,distance=..0.7,nbt={Item:{Count:1b,tag:{Enchantments:[{}]}}}] if data entity @s Item.tag.Enchantments[0].id positioned ~ ~-2 ~ run function gm4_enchantment_extractors:extract
