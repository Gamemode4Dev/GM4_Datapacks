# @template gm4:test_platform
# @dummy ~ ~1 ~
# @timeout 400

give @s lectern
execute at @s run tp @s ~ ~ ~ facing ~ ~-1.5 ~1.5
dummy @s use block ~ ~ ~1
assert entity @s[advancements={gm4:book_binders=true}]

give @s paper{gm4_book_binders:{item:"enchanted_page"},Enchantments:[{id:"minecraft:efficiency",lvl:3}]}
dummy @s use entity @e[tag=gm4_book_binder,distance=..3,limit=1]

await entity @e[tag=gm4_book_binder,distance=..3,nbt=!{HandItems:[{id:"minecraft:paper"}]}]

clear @s
give @s leather
dummy @s use entity @e[tag=gm4_book_binder,distance=..3,limit=1]

await entity @e[tag=gm4_book_binder,distance=..3,nbt=!{HandItems:[{id:"minecraft:leather"}]}]

await entity @s[nbt={Inventory:[{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:efficiency",lvl:3}]}}]}]
