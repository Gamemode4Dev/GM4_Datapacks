# @template gm4:test_platform
# @dummy ~ ~1 ~
# @timeout 200

give @s lectern
execute at @s run tp @s ~ ~ ~ facing ~ ~-1.5 ~1.5
dummy @s use block ~ ~ ~1
assert entity @s[advancements={gm4:book_binders=true}]

item replace entity @s weapon.mainhand with minecraft:enchanted_book[stored_enchantments={efficiency:3,silk_touch:1}]
dummy @s use entity @e[tag=gm4_book_binder,distance=..3,limit=1]

await entity @s[advancements={gm4:book_binders_debind=true}]

await items entity @s container.* minecraft:paper[enchantments={silk_touch:1},custom_data~{gm4_book_binders:{item:"enchanted_page"}}]
assert items entity @s container.* minecraft:paper[enchantments={efficiency:3},custom_data~{gm4_book_binders:{item:"enchanted_page"}}]
