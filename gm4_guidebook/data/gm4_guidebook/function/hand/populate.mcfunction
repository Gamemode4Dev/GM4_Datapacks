# updates the player's book
# @s = player that triggers gm4_guide
# at @s
# run from gm4_guidebook:hand/update

$loot replace entity @s[predicate=gm4_guidebook:book_in_mainhand] weapon.mainhand loot {"pools":[{"rolls":1,"entries":[{"type":"minecraft:loot_table","value":"gm4_guidebook:items/guidebook","functions":[{"type":"minecraft:set_components","components":{"minecraft:written_book_content":{"title":"Gamemode 4 Guidebook","author":"Unknown","generation":3,"pages":$(pages)}}},{"type":"minecraft:set_custom_data","tag":"{gm4_guidebook:{lectern:0b,trigger:$(trigger)}}"},{"type":"minecraft:set_count","count":$(count)}]}]}]}
$loot replace entity @s[predicate=gm4_guidebook:book_in_offhand] weapon.offhand loot {"pools":[{"rolls":1,"entries":[{"type":"minecraft:loot_table","value":"gm4_guidebook:items/guidebook","functions":[{"type":"minecraft:set_components","components":{"minecraft:written_book_content":{"title":"Gamemode 4 Guidebook","author":"Unknown","generation":3,"pages":$(pages)}}},{"type":"minecraft:set_custom_data","tag":"{gm4_guidebook:{lectern:0b,trigger:$(trigger)}}"},{"type":"minecraft:set_count","count":$(count)}]}]}]}
