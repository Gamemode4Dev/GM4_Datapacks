execute as @e[type=item,nbt={Item:{id:"minecraft:enchanting_table",Count:1b},OnGround:1b}] at @s if block ~ ~-1 ~ dropper{Items:[{Slot:0b,id:"minecraft:book",Count:1b},{Slot:1b,id:"minecraft:hopper",Count:1b},{Slot:2b,id:"minecraft:book",Count:1b},{Slot:3b,id:"minecraft:book",Count:1b},{Slot:4b,id:"minecraft:writable_book",Count:1b},{Slot:5b,id:"minecraft:book",Count:1b},{Slot:6b,id:"minecraft:book",Count:1b},{Slot:7b,id:"minecraft:book",Count:1b},{Slot:8b,id:"minecraft:book",Count:1b}]} align xyz positioned ~0.5 ~-0.5 ~0.5 run function enchantment_extractors:create
execute as @e[type=armor_stand,tag=gm4_enchantment_extractor] at @s positioned ~ ~1 ~ run function enchantment_extractors:process

schedule function enchantment_extractors:main 16t
