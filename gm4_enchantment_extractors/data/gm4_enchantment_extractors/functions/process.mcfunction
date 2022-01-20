# @s = enchantment extractor marker_entity
# positioned 1 block above (at the dropper)
# run from main

particle portal ~ ~0.5 ~ 0 0 0 .5 1
execute if block ~ ~ ~ dropper{Items:[{tag:{Enchantments:[{}]}}]} positioned ~ ~-1.2 ~ as @e[type=armor_stand,tag=gm4_enchantment_extractor_stand,limit=1,distance=..0.01] positioned ~ ~1.2 ~ run function gm4_enchantment_extractors:extract
