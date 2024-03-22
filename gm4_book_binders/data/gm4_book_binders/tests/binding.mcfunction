# @template gm4:test_platform
# @dummy ~ ~1 ~
# @timeout 400

give @s lectern
execute at @s run tp @s ~ ~ ~ facing ~ ~-1.5 ~1.5
dummy @s use block ~ ~ ~1
assert entity @s[advancements={gm4:book_binders=true}]

item replace entity @s weapon.mainhand with minecraft:paper[enchantments={efficiency:3},custom_data={gm4_book_binders:{item:"enchanted_page"}}]
dummy @s use entity @e[tag=gm4_book_binder,distance=..3,limit=1]

await not items entity @e[tag=gm4_book_binder,distance=..3] weapon.* minecraft:paper

item replace entity @s weapon.mainhand with minecraft:leather
dummy @s use entity @e[tag=gm4_book_binder,distance=..3,limit=1]

await not items entity @e[tag=gm4_book_binder,distance=..3] weapon.* minecraft:leather

await items entity @s container.* minecraft:enchanted_book[count=1,stored_enchantments={efficiency:3}]
