summon item ~ ~1 ~ {Item:{id:enchanting_table,Count:1},Passengers:[{id:item,Item:{id:"hopper",Count:1}},{id:item,Item:{id:"book",Count:7}},{id:item,Item:{id:"writable_book",Count:1}}]}
data remove entity @e[type=item,distance=..3,limit=1,nbt={Item:{tag:{display:{Name:"{\"text\":\"Enchantment Extractor\"}"}}}}] Item.tag.display
kill @s
