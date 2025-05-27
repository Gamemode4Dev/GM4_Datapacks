# places the book in the zombie villager's hand
# @s = random zombie villager that spawned naturally (not converted)
# located at world spawn
# run from gm4_guidebook:main

# put book in mainhand
$loot replace entity @s weapon.mainhand loot {"pools":[{"rolls":1,"entries":[{"type":"minecraft:loot_table","value":"gm4_guidebook:items/guidebook","functions":[{"function":"minecraft:set_custom_data","tag":"{gm4_guidebook:{lectern:0b,trigger:1}}"},{"function":"minecraft:set_components","components":{"minecraft:written_book_content":{"pages":$(front_matter),"title":"Gamemode 4 Guidebook","author":"Unknown","generation":3}}}]}]}]}

# make zombie drop the book upon player kill
data modify entity @s drop_chances.mainhand set value 1.0f
