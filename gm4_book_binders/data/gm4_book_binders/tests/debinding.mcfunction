# @template gm4:test_platform
# @dummy ~ ~1 ~
# @timeout 200

give @s lectern
execute at @s run tp @s ~ ~ ~ facing ~ ~-1.5 ~1.5
dummy @s use block ~ ~ ~1
assert entity @s[advancements={gm4:book_binders=true}]

give @s enchanted_book{StoredEnchantments:[{id:"minecraft:silk_touch",lvl:1},{id:"minecraft:efficiency",lvl:3}]}
dummy @s use entity @e[tag=gm4_book_binder,distance=..3,limit=1]

await entity @s[advancements={gm4:book_binders_debind=true}]

await entity @s[nbt={Inventory:[{id:"minecraft:paper",Count:1b,tag:{gm4_book_binders:{item:"enchanted_page"},Enchantments:[{id:"minecraft:silk_touch",lvl:1}]}},{id:"minecraft:paper",Count:1b,tag:{gm4_book_binders:{item:"enchanted_page"},Enchantments:[{id:"minecraft:efficiency",lvl:3}]}}]}]
