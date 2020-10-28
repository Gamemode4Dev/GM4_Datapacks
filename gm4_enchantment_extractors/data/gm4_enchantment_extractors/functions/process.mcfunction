#@s = enchantment extractor armor stand
#positioned 1 block above (at the dropper)
#run from main

execute unless block ~ ~ ~ dropper run function gm4_enchantment_extractors:destroy
execute align xyz if entity @e[type=armor_stand,tag=gm4_machine,limit=1,dx=0] run function gm4_enchantment_extractors:destroy
particle portal ~ ~0.8 ~ 0 0 0 .5 1
execute if block ~ ~ ~ dropper{Items:[]} positioned ~ ~1 ~ as @e[type=item,distance=..0.7,nbt={Item:{Count:1b,tag:{Enchantments:[{}]}}}] if data entity @s Item.tag.Enchantments[0].id positioned ~ ~-2 ~ run function gm4_enchantment_extractors:extract
data merge entity @s {Fire:2000}
