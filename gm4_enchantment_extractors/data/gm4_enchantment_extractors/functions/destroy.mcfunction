#@s = enchantment extractor stand
#run from enchantment_extractors:process

loot spawn ~ ~0.6 ~ loot gm4_enchantment_extractors:destroy_enchantment_extractor
data remove entity @e[type=item,distance=..3,limit=1,nbt={Item:{tag:{display:{Name:"{\"text\":\"Enchantment Extractor\"}"}}}}] Item.tag.display
kill @s
