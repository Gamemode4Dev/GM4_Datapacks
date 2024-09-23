# gives all players the guidebook upon joining for the first time
# @s = new player
# located at @s
# run from advancement gm4_guidebook:first_join

$loot give @s loot {"pools":[{"rolls":1,"entries":[{"type":"minecraft:loot_table","value":"gm4_guidebook:items/guidebook","functions":[{"function":"minecraft:set_custom_data","tag":"{gm4_guidebook:{lectern:0b,trigger:1}}"},{"function":"minecraft:set_components","components":{"minecraft:written_book_content":{"pages":$(front_matter),"title":"Gamemode 4 Guidebook","author":"Unknown","generation":3}}}]}]}]}
